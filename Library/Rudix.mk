# Rudix.mk - The BuildSystem itself
#
# Copyright (c) 2005-2012 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada
#

BuildSystem = 20120312

Vendor = org.rudix
UncompressedName = $(Name)-$(Version)
PortDir := $(shell pwd)
SourceDir = $(Name)-build
BuildDir = $(SourceDir)
InstallDir = $(Name)-install
DistName = $(Name)
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
DataDir = $(Prefix)/share
DocDir = $(DataDir)/doc
ManDir = $(DataDir)/man
InfoDir = $(DataDir)/info

#
# Framework
#
all: test install check

# Retrieve source
retrieve:
	@$(call info_color,Retrieving)
	@$(call retrieve_pre_hook)
	@$(call retrieve_inner_hook)
	@$(call retrieve_post_hook)
	@$(call info_color,Done)
	@touch retrieve

# Prepare source to compile
prep: retrieve
	@$(call info_color,Preparing)
	@$(call prep_pre_hook)
	@$(call prep_inner_hook)
	@$(call prep_post_hook)
	@$(call info_color,Done)
	@touch prep

# Build source
build: prep $(BuildRequires)
	@$(call info_color,Building)
	@$(call build_pre_hook)
	@$(call build_inner_hook)
	@$(call build_post_hook)
	@$(call info_color,Done)
	@touch build

# Install into a temporary directory
install: build
	@$(call info_color,Installing)
	@$(call install_pre_hook)
	@$(call install_inner_hook)
	@$(call install_post_hook)
	@$(call info_color,Done)
	@touch install

# Run tests from the sources
test: build
	@$(call info_color,Testing)
	@$(call test_pre_hook)
	@$(call test_inner_hook)
	@$(call test_post_hook)
	@$(call info_color,Done)
	@touch test

# Sanity check-up (post-install tests)
check: install
	@$(call info_color,Checking)
	@$(call check_pre_hook)
	@$(call check_inner_hook)
	@$(call check_post_hook)
	@$(call info_color,Done)
	@touch check

# Create package
pkg: test install check
	@$(call info_color,Packing)
	@$(call pkg_pre_hook)
	@$(call pkg_inner_hook)
	@$(call pkg_post_hook)
	@$(call info_color,Done)
	@touch pkg

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg

clean: installclean
	rm -rf prep build test check $(SourceDir)

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
	@mv -vf *.wiki ../../Wiki/

upload: pkg
	@$(call info_color,Sending $(PkgFile))
	../../Library/googlecode_upload.py -p rudix -s "$(Title)" -d Description -l $(RUDIX_LABELS) $(PkgFile)
	hg tag -f $(DistName)-$(Version)-$(Revision)
	echo twitter -erudix4mac set "$(Title): $(DistName)-$(Version)-$(Revision) http://code.google.com/p/rudix/downloads/detail?name=$(PkgFile)"
	@$(call info_color,Finished)

help:
	@echo "Construction rules:"
	@echo "  retrieve - Retrieve source"
	@echo "  prep - After Prepare source to compile"
	@echo "  build - Build source"
	@echo "  install - Install into a temporary directory"
	@echo "  test - Run tests from the sources"
	@echo "  check - Sanity check-up (post-install tests)"
	@echo "  pkg - Create package"
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

define explode
case `file -b -z --mime-type $(Source)` in \
	application/x-tar) tar zxf $(Source) ;; \
	application/zip) unzip -o -a -d $(BuilDir) $(Source) ;; \
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
/Developer/usr/bin/packagemaker \
	--doc $(Name).pmdoc \
	--id $(Vendor).pkg.$(DistName) \
	--version $(Version)-$(Revision) \
	--title "$(Title) $(Version)" \
$(if $(wildcard $(PortDir)/scripts),--scripts $(PortDir)/scripts) \
	--out $(PortDir)/$(PkgFile)
endef

ifeq ($(RUDIX_APPLY_RECOMMENDATIONS),yes)
define apply_recommendations
rm -f $(Name).pmdoc/*-contents.xml
open $(Name).pmdoc
../../Library/apply_recommendations.sh $(Name).pmdoc
endef
endif

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
./configure $(ConfigureExtra) \
	--prefix=$(Prefix)
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
@$(call info_color,Finished)
endef
endif

define install_base_documentation
install -d $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
endef

define test_documentation
@$(call info_color,Testing documentation)
test -d $(InstallDir)/usr/local/man && $(call error_color,Manual pages found in old /usr/local/man/ place)
test -d $(InstallDir)/usr/local/info && $(call error_color,Info pages found in old /usr/local/info/ place)
@$(call info_color,Finished)
endef

ifeq ($(RUDIX_STRIP_PACKAGE),yes)
define strip_macho
$(call info_color,Stripping binaries)
for x in $(wildcard $(PortDir)/$(InstallDir)/$(BinDir)/*) ; do \
	strip $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(SBinDir)/*) ; do \
	strip $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.dylib) ; do \
	strip -x $$x ; done
for x in $(wildcard $(PortDir)/$(InstallDir)/$(LibDir)/*.a) ; do \
	strip -x $$x ; done
$(call info_color,Finished)
endef
endif

#
# Common inner hooks
#
define retrieve_inner_hook
$(fetch) $(URL)/$(Source)
endef

define prep_inner_hook
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

define check_inner_hook
$(test_universal)
$(test_documentation)
endef
