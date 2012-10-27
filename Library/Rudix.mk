#
# Rudix.mk - The BuildSystem itself
#
# Copyright (c) 2005-2012 Rudá Moura
# Authors: Rudá Moura, Leonardo Santagada
#

BuildSystem = 20121026

Vendor = org.rudix
UncompressedName = $(Name)-$(Version)
PortDir := $(shell pwd)
SourceDir = $(Name)-build
BuildDir = $(SourceDir)
InstallDir = $(Name)-install
DistName = $(Name)
PkgId = $(Vendor).pkg.$(DistName)
PkgFile = $(DistName)-$(Version)-$(Revision).pkg

#
# Build flags options
#
Arch = $(shell sysctl -n hw.machine)
NumCPU = $(shell sysctl -n hw.ncpu)
ifeq ($(RUDIX_UNIVERSAL),yes)
ArchFlags = -arch i386 -arch x86_64
else ifeq ($(RUDIX_UNIVERSAL),no)
ArchFlags = -arch $(Arch)
endif
OptFlags = -Os
CFlags = $(ArchFlags) $(OptFlags)
CxxFlags = $(CFlags)
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
# Framework
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
test: pkg
	@$(call info_color,Testing)
	@$(call test_pre_hook)
	@$(call test_inner_hook)
	@$(call test_post_hook)
	@$(call info_color,Done)
	@touch $@

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg *.pmdoc

clean: installclean
	rm -rf checksum prep build test $(SourceDir) *~

distclean: clean pkgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(Source)

pmdoc:
	$(create_pmdoc)
	$(sanitize_pmdoc)

wiki:
	@env Name="$(Name)" Title="$(Title)" PkgFile="$(PkgFile)" \
		../../Library/mkwikipage.py

upload: pkg test
	@$(call info_color,Sending $(PkgFile))
	../../Library/googlecode_upload.py -p $(RUDIX) -s "$(Title)" -d Description -l $(RUDIX_LABELS) $(PkgFile)
	@echo "$(Title): $(DistName)-$(Version)-$(Revision) http://code.google.com/p/rudix/wiki/$(DistName)"
	@echo git tag $(DistName)-$(Version)-$(Revision)


# FIXME: Temporary hack to build static packages.
static: buildclean installclean
	make pkg \
		RUDIX_BUILD_STATIC_LIBS=yes \
		DistName=static-$(Name)
	@touch $@

help:
	@echo "Construction rules:"
	@echo "  retrieve - Retrieve source"
	@echo "  prep - After Prepare source to compile"
	@echo "  build - Build source"
	@echo "  install - Install into a temporary directory"
	@echo "  pkg - Create package"
	@echo "  test - Run all tests"
	@echo "Clean-up rules:"
	@echo "  clean - Clean up until retrieve"
	@echo "  distclean - After clean, remove config.cache and package"
	@echo "  realdistclean - After distclean, remove source"

about:
	@echo "$(Name): $(Title) $(Version)-$(Revision)"

.PHONY: buildclean installclean pkgclean clean distclean realdistclean sanitizepmdoc wiki upload help about

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
	application/x-xz) tar zxf $(Source) ;; \
	application/zip) tar zxf $(Source) ;; \
	*) false ;; \
esac
endef

define apply_patches
for x in $(wildcard *.patch patches/*.patch) ; do \
	patch -p0 -d $(SourceDir) < $$x ; done
endef

define create_pmdoc
../../Library/mkpmdoc.py \
	--name $(Name) \
	--version $(Version)-$(Revision) \
	--title "$(Title)" \
	--description Description \
	--readme $(ReadMeFile) \
	--license $(LicenseFile) \
	--components '$(Components)' \
	--index --pkgref \
	.
endef

define create_pkg
$(RUDIX_PACKAGEMAKER) \
	--doc $(Name).pmdoc \
	--id $(PkgId) \
	--version $(Version)-$(Revision) \
	--title "$(Title) $(Version)" \
$(if $(wildcard $(PortDir)/scripts),--scripts $(PortDir)/scripts) \
	--out $(PortDir)/$(PkgFile)
endef

define apply_recommendations
rm -f $(Name).pmdoc/*-contents.xml
open $(Name).pmdoc
../../Library/apply_recommendations.sh $(Name).pmdoc
endef

define sanitize_pmdoc
for x in $(Name).pmdoc/*-contents.xml ; do \
	perl -p -i -e 's/o="[^"]*"/o="root"/ ; s/pt="[^"]*"/pt="$(Name)-install"/' $$x ; done
for x in $(Name).pmdoc/*.xml ; do \
	xmllint --format --output $$x $$x ; done
endef

define check_pmdoc
grep root $(Name).pmdoc/*-contents.xml >/dev/null
endef

define configure
./configure --prefix=$(Prefix) $(ConfigureExtra)
endef

define make
$(MAKE) $(MakeFlags)
endef

define verify_universal
lipo $1 -verify_arch i386 x86_64 2>/dev/null || $(call warning_color,file $1 is not an Universal Binary)
endef

ifeq ($(RUDIX_UNIVERSAL),yes)
define test_universal
@$(call info_color,Starting Universal Binaries test)
for x in $(wildcard $(PortDir)/$(InstallDir)/$(BinDir)/*) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(SBinDir)/*) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.dylib) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.a) ; do \
	$(call verify_universal,$$x) ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(PythonSitePackages)/*/*.so) ; do \
	$(call verify_universal,$$x) ; done
endef
endif

define test_non_native_dylib
@$(call info_color,Testing for external linkage)
for x in $(wildcard $(InstallDir)/$(BinDir)/*) ; do \
	if otool -L $$x | grep -q '/usr/local/lib/' ; then $(call warning_color,Binary $$x linked with non-native dynamic library) ; \
	fi ; \
done
for x in $(wildcard $(InstallDir)/$(SBinDir)/*) ; do \
	if otool -L $$x | grep -q '/usr/local/lib/' ; then $(call warning_color,Binary $$x linked with non-native dynamic library) ; \
	fi ; \
done
for x in $(wildcard $(InstallDir)/$(LibDir)/*.dylib) ; do \
	if otool -L $$x | grep -q '/usr/local/lib/' ; then $(call warning_color,Library $$x linked with non-native dynamic library) ; \
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
install -d $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
endef

define test_documentation
@$(call info_color,Testing documentation)
test -d $(InstallDir)/usr/local/man && $(call error_color,Manual pages found in old /usr/local/man/ place) || true
test -d $(InstallDir)/usr/local/info && $(call error_color,Info pages found in old /usr/local/info/ place) || true
endef

ifeq ($(RUDIX_STRIP_PACKAGE),yes)
define strip_macho
$(call info_color,Stripping binaries)
for x in $(wildcard $(PortDir)/$(InstallDir)/$(BinDir)/*) ; do \
	strip -x $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(SBinDir)/*) ; do \
	strip -x $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.dylib) ; do \
	strip -x $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.a) ; do \
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
$(create_pmdoc)
$(apply_recommendations)
$(sanitize_pmdoc)
$(check_pmdoc)
$(create_pkg)
endef

define test_pre_hook
$(test_build)
$(test_universal)
$(test_non_native_dylib)
$(test_apache_modules)
$(test_documentation)
@$(call info_color,Uninstalling previous package)
sudo ../../Library/poof.py 2>/dev/null $(Vendor).pkg.$(DistName) || true
@$(call info_color,Installing the new package)
sudo installer -pkg $(PkgFile) -target /
endef

define test_post_hook
@$(call info_color,Uninstalling package)
sudo ../../Library/poof.py $(Vendor).pkg.$(DistName)
endef
