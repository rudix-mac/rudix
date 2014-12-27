#
# The Rudix BuildSystem itself.
#
# Copyright © 2005-2014 Rudix
# Authors: Rudá Moura, Leonardo Santagada
#

BuildSystem = 20141029

# Get user preferences (if defined)
-include ~/.rudix.conf

OSXVersion=$(shell sw_vers -productVersion | cut -d '.' -f 1,2)
Arch = $(shell sysctl -n hw.machine)
NumCPU = $(shell sysctl -n hw.ncpu)

ifeq ($(OSXVersion),10.10)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.9)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.8)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.7)
RUDIX_UNIVERSAL?=no
else ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL?=yes
else
RUDIX_UNIVERSAL?=yes
endif

ifeq ($(RUDIX_UNIVERSAL),yes)
RUDIX_DISABLE_DEPENDENCY_TRACKING?=yes
else
RUDIX_DISABLE_DEPENDENCY_TRACKING?=no
endif

RUDIX_SAVE_CONFIGURE_CACHE?=yes
RUDIX_STRIP_PACKAGE?=yes
RUDIX_ENABLE_NLS?=yes
RUDIX_BUILD_WITH_STATIC_LIBS?=yes
RUDIX_BUILD_STATIC_LIBS?=no
RUDIX_BUILD_STATIC?=no
RUDIX_PARALLEL_EXECUTION?=yes
RUDIX_RUN_ALL_TESTS?=yes

Vendor = org.rudix
UncompressedName = $(Name)-$(Version)
PortDir := $(shell pwd)
SourceDir = $(Name)-build
BuildDir = $(SourceDir)
InstallDir = $(Name)-install
DestDir= $(PortDir)/$(InstallDir)
ReadMeFile = $(SourceDir)/README
LicenseFile = $(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_STATIC),yes)
RUDIX_BUILD_STATIC_LIBS=yes
DistName = static-$(Name)
else
DistName = $(Name)
endif

PkgId = $(Vendor).pkg.$(DistName)
PkgFile = $(DistName)-$(Version)-$(Revision).pkg

#
# Build flags options
#
ifeq ($(OSXVersion),10.10)
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch x86_64 -arch i386,-arch x86_64)
else ifeq ($(OSXVersion),10.9)
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch x86_64 -arch i386,-arch x86_64)
else ifeq ($(OSXVersion),10.8)
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch x86_64 -arch i386,-arch x86_64)
else ifeq ($(OSXVersion),10.7)
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch x86_64 -arch i386,-arch x86_64)
else ifeq ($(OSXVersion),10.6)
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch x86_64 -arch i386,-arch i386)
else
ArchFlags = $(if $(findstring yes,$(RUDIX_UNIVERSAL)),-arch ppc -arch i386,-arch i386)
endif
OptFlags = -Os
CFlags = $(ArchFlags) $(OptFlags)
CxxFlags = $(ArchFlags) $(OptFlags)
LdFlags = $(ArchFlags)

ifeq ($(RUDIX_PARALLEL_EXECUTION),yes)
MakeFlags = -j $(NumCPU)
endif

#
# Install dir options
#
Prefix = /usr/local
BinDir = $(Prefix)/bin
SBinDir = $(Prefix)/sbin
IncludeDir = $(Prefix)/include
LibDir = $(Prefix)/lib
LibExecDir = $(Prefix)/libexec
SysConfDir = $(Prefix)/etc
LocalStateDir = $(Prefix)/var
DataDir = $(Prefix)/share
DocDir = $(DataDir)/doc
ManDir = $(DataDir)/man
InfoDir = $(DataDir)/info

#
# Select Python version
#
ifeq ($(OSXVersion),10.10)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.9)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.8)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.7)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.6)
Python = /usr/bin/python2.6
PythonSitePackages = /Library/Python/2.6/site-packages
else
Python = /usr/bin/python2.5
PythonSitePackages = /Library/Python/2.5/site-packages
endif

#
# Framework (hooks)
#

all: pkg

# Retrieve source
retrieve:
	@$(call info_color,Retrieving)
	@$(call retrieve_pre_hook)
	@$(call retrieve_inner_hook)
	@$(call retrieve_post_hook)
	@$(call info_color,Done)
	@touch $@

# Prepare source to compile
prep: retrieve
	@$(call info_color,Preparing)
	@$(call prep_pre_hook)
	@$(call prep_inner_hook)
	@$(call prep_post_hook)
	@$(call info_color,Done)
	@touch $@

# Build source
build: prep $(BuildRequires)
	@$(call info_color,Building)
	@$(call build_pre_hook)
	@$(call build_inner_hook)
	@$(call build_post_hook)
	@$(call info_color,Done)
	@touch $@

# Check build
check: build
	@$(call info_color,Checking build)
	@$(call check_pre_hook)
	@$(call check_inner_hook)
	@$(call check_post_hook)
	@$(call info_color,Done)
	@touch $@

# Install into a temporary directory
install: build
	@$(call info_color,Installing)
	@$(call install_pre_hook)
	@$(call install_inner_hook)
	@$(call install_post_hook)
	@$(call info_color,Done)
	@touch $@

# Create package
pkg: install
	@$(call info_color,Packing)
	@$(call pkg_pre_hook)
	@$(call pkg_inner_hook)
	@$(call pkg_post_hook)
	@$(call info_color,Done)
	@touch $@

# Run all tests
test: pkg check
	@$(call info_color,Testing)
	@$(call test_pre_hook)
	@$(call test_inner_hook)
	@$(call test_post_hook)
	@$(call info_color,Done)
	@touch $@

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg Distribution Resources

clean: installclean
	rm -rf checksum prep build check test $(SourceDir) *~

distclean: clean pkgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(Source)

static: prep installclean buildclean
	$(MAKE) RUDIX_BUILD_STATIC=yes pkg

help:
	@echo "Rudix BuildSystem"
	@echo "-----------------"
	@echo "Port rules:"
	@echo "  retrieve - Retrieve source from the Internet"
	@echo "  prep - Expand/uncompress source"
	@echo "  build - Build port"
	@echo "  check - Check build (run internal tests)"
	@echo "  install - Install into a temporary directory"
	@echo "  pkg - Create package from the temporary directory"
	@echo "  test - Run tests (install and run more test)"
	@echo "Clean-up rules:"
	@echo "  clean - Clean files but leaves retrieve alone"
	@echo "  distclean - Do clean, plus remove config.cache and package"
	@echo "  realdistclean - Do distclean, plus remove source"
	@echo "Other rules:"
	@echo "  help - This help message"
	@echo "  about - Display information about the port."
	@echo "  static - Create package with static libraries."

about:
	@echo "---"
	@echo "$(Title) ($(Name)-$(Version)-$(Revision))"
	@echo "Site: $(Site)"
	@echo "License: $(License)"
	@echo "Source: $(URL)/$(Source)"

#
# Functions
#
define info_color
printf "\033[32m$1\033[0m\n"
endef

define warning_color
printf "\033[33mWarning: $1\033[0m\n"
endef

define error_color
printf "\033[31mError: $1\033[0m\n"
endef

define fetch
curl -f -O -C - -L
endef

define verify_checksum
if test "$(Checksum)" != "" ; then \
	echo "$(Checksum)  $(Source)" > checksum ; \
	shasum --warn --check checksum ; \
fi
endef

define explode
case `file -b --mime-type $(Source)` in \
	application/x-tar) tar xf $(Source) ;; \
	application/x-gzip) tar zxf $(Source) ;; \
	application/x-bzip2) tar jxf $(Source) ;; \
	application/x-xz) tar xf $(Source) ;; \
	application/zip) tar zxf $(Source) ;; \
	*) false ;; \
esac
endef

define apply_patches
for x in $(wildcard *.patch patches/*.patch) ; do \
	patch -p0 -d $(SourceDir) < $$x ; done
endef

define create_distribution
../../Library/synthesize_distribution.py \
	--title "$(Title) $(Version)" \
	--pkgid $(PkgId) \
	--name $(DistName) \
	--installpkg $(Name)install.pkg \
	$(if $(Requires),$(foreach req,$(Requires),--requires $(req)))
endef

define create_resources
mkdir -p Resources/en.lproj
cp -av $(ReadMeFile) Resources/en.lproj/ReadMe
cp -av $(LicenseFile) Resources/en.lproj/License
cp -av ../../Library/Introduction Resources/en.lproj/Welcome
cp -av ../../Library/rudix.png Resources/en.lproj/background
endef

define create_installpkg
pkgbuild \
	--identifier $(PkgId) \
	--version $(Version)-$(Revision) \
	--root $(InstallDir) \
	--install-location / \
	$(if $(wildcard $(PortDir)/scripts),--scripts $(PortDir)/scripts) \
	$(Name)install.pkg
endef

define create_pkg
productbuild \
	--distribution Distribution \
	--resources Resources \
	$(PkgFile)
endef

define configure
./configure --prefix=$(Prefix) $(ConfigureExtra)
endef

define make
$(MAKE) $(MakeFlags)
endef

define make_install
$(MAKE) $(MakeInstallFlags) install
endef

define verify_universal
../../Library/fatty.py $1 || $(call warning_color,file $1 is not an Universal Binary)
endef

ifeq ($(RUDIX_UNIVERSAL),yes)
define test_universal
@$(call info_color,Testing for Universal Binaries)
for x in $(wildcard $(DestDir)$(BinDir)/*) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(DestDir)$(SBinDir)/*) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(DestDir)$(LibDir)/*.dylib) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(DestDir)$(LibDir)/*.a) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(DestDir)$(PythonSitePackages)/*/*.so) ; do \
	$(call verify_universal,$$x) ; done
endef
endif

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

define install_base_documentation
install -d $(DestDir)$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(DestDir)$(DocDir)/$(Name)
install -m 644 $(LicenseFile) $(DestDir)$(DocDir)/$(Name)
endef

define test_documentation
@$(call info_color,Testing documentation)
test -d $(InstallDir)/usr/local/man && $(call error_color,Manual pages found in old /usr/local/man/ place) || true
test -d $(InstallDir)/usr/local/info && $(call error_color,Info pages found in old /usr/local/info/ place) || true
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
# Common inner hooks
#
define retrieve_inner_hook
$(fetch) $(URL)/$(Source)
endef

define prep_inner_hook
$(verify_checksum)
$(explode)
mv -v $(UncompressedName) $(SourceDir)
$(apply_patches)
endef

define pkg_inner_hook
$(strip_macho)
$(create_installpkg)
$(create_distribution)
$(create_resources)
$(create_pkg)
endef

define test_pre_hook
$(test_universal)
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

.PHONY: buildclean installclean pkgclean clean distclean realdistclean help about
