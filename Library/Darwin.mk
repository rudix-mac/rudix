#
# The Darwin part of the BuildSystem.
#
# Copyright © 2005-2018 Rudix
# Authors: Rudá Moura, Leonardo Santagada
#

OSXVersion=$(shell sw_vers -productVersion | cut -d '.' -f 1,2)

PkgId = $(Vendor).pkg.$(DistName)
PkgFile = $(DistName)-$(Version).pkg

#
# Build flags options
#
ArchFlags = -arch x86_64
# Minimum OS X version supported
CompatFlags = -mmacosx-version-min=10.11
OptFlags = -Os
CFlags = $(ArchFlags) $(OptFlags) $(CompatFlags)
CxxFlags = $(ArchFlags) $(OptFlags) $(CompatFlags)
CppFlags = -I$(IncludeDir)
LdFlags = $(ArchFlags) $(CompatFlags)
ifeq ($(RUDIX_PARALLEL_EXECUTION),yes)
MakeFlags = -j $(NumCPU)
endif

#
# Select Python version
#
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages

#
# Functions
#

define create_distribution
../../Library/synthesize_distribution.py \
	--output $(ResourcesDir)/Distribution \
	--title "$(Title) $(Version)" \
	--pkgid $(PkgId) \
	--name $(DistName) \
	--installpkg $(Name)install.pkg \
	$(if $(Requires),$(foreach req,$(Requires),--requires $(req)))
endef

define create_resources
mkdir -p $(PortDir)/$(ResourcesDir)/Resources/en.lproj
cp -a $(ReadMeFile)  $(PortDir)/$(ResourcesDir)/Resources/en.lproj/ReadMe
cp -a $(LicenseFile) $(PortDir)/$(ResourcesDir)/Resources/en.lproj/License
cp -a ../../Library/Introduction $(PortDir)/$(ResourcesDir)/Resources/en.lproj/Welcome
cp -a ../../Library/rudix.png    $(PortDir)/$(ResourcesDir)/Resources/en.lproj/background
endef

define create_installpkg
pkgbuild \
	--identifier $(PkgId) \
	--version $(Version) \
	--root $(InstallDir) \
	--ownership preserve-other \
	--install-location / \
	$(if $(wildcard $(PortDir)/scripts),--scripts $(PortDir)/scripts) \
	$(Name)install.pkg
endef

define create_pkg
productbuild \
	--distribution $(PortDir)/$(ResourcesDir)/Distribution \
	--resources $(PortDir)/$(ResourcesDir)/Resources \
	$(PkgFile)
endef

define verify_universal
../../Library/fatty.py $1 || $(call warning_color,file $1 is not an Universal Binary)
endef

define test_non_native_dylib
@$(call info_color,Testing for external linkage)
for x in $(wildcard $(InstallDir)$(BinDir)/*) ; do \
	if ../../Library/display_dylibs.py \
		--exclude-from-path=$(InstallDir)$(LibDir) $$x | grep -q $(LibDir) ; \
	then $(call error_color,Binary $$x linked with non-native dynamic library) ; \
	fi ; \
done
for x in $(wildcard $(InstallDir)$(SBinDir)/*) ; do \
	if  ../../Library/display_dylibs.py \
		--exclude-from-path=$(InstallDir)$(LibDir) $$x | grep -q $(LibDir) ; \
	then $(call error_color,Binary $$x linked with non-native dynamic library) ; \
	fi ; \
done
for x in $(wildcard $(InstallDir)$(LibDir)/*.dylib) ; do \
	if ../../Library/display_dylibs.py \
		--exclude-from-path=$(InstallDir)$(LibDir) $$x | grep -q $(LibDir) ; \
	then $(call error_color,Library $$x linked with non-native dynamic library) ; \
	fi ; \
done
endef

define test_apache_modules
@$(call info_color,Testing Apache modules)
for x in $(wildcard $(InstallDir)/usr/libexec/apache2/*.so) ; do \
	$(call error_color,Apache module $$x will install in system path) ; \
done
endef

ifeq ($(RUDIX_STRIP_PACKAGE),yes)
define strip_macho
$(call info_color,Stripping binaries)
for x in $(wildcard $(DestDir)$(BinDir)/*) ; do \
	strip -x $$x ; done
for x in $(wildcard $(DestDir)$(SBinDir)/*) ; do \
	strip -x $$x ; done
for x in $(wildcard $(DestDir)$(LibDir)/*.dylib) ; do \
	strip -x $$x ; done
for x in $(wildcard $(DestDir)$(LibDir)/*.a) ; do \
	strip -x $$x ; done
endef
endif

#
# Hooks
#

define pkg_hook
$(create_installpkg)
$(create_resources)
$(create_distribution)
$(create_pkg)
endef

define test_pre_hook
$(test_non_native_dylib)
$(test_apache_modules)
$(test_documentation)
@$(call info_color,Uninstalling previous package)
@echo "Administrator (root) credentials required"
sudo ../../Library/remover.py 2>/dev/null $(Vendor).pkg.$(DistName) || true
@$(call info_color,Installing the new package)
@echo "Administrator (root) credentials required"
sudo ../../Library/installer.py $(PkgFile)
endef

define test_post_hook
@$(call info_color,Uninstalling package)
@echo "Administrator (root) credentials required"
sudo ../../Library/remover.py 2>/dev/null $(Vendor).pkg.$(DistName) || \
	$(call warning_color,Possible dirty uninstall)
endef
