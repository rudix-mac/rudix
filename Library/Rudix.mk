# Rudix.mk - The BuildSystem itself
# Copyright (c) 2005-2012 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

BuildSystem = 20120217

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
all: install
retrieve:
	@$(call info_color,Retrieving)
	@$(call retrieve_pre_hook)
	@$(call retrieve_inner_hook)
	@$(call retrieve_post_hook)
	@$(call info_color,Done)
	@touch retrieve

prep: retrieve
	@$(call info_color,Preparing)
	@$(call prep_pre_hook)
	@$(call prep_inner_hook)
	@$(call prep_post_hook)
	@$(call info_color,Done)
	@touch prep

build: prep $(BuildRequires)
	@$(call info_color,Building)
	@$(call build_pre_hook)
	@$(call build_inner_hook)
	@$(call build_post_hook)
	@$(call info_color,Done)
	@touch build

install: build
	@$(call info_color,Installing)
	@$(call install_pre_hook)
	@$(call install_inner_hook)
	@$(call install_post_hook)
	@$(call info_color,Done)
	@touch install

test: install
	@$(call info_color,Testing)
	@$(call test_pre_hook)
	@$(call test_inner_hook)
	@$(call test_post_hook)
	@$(call info_color,Done)
	@touch test

pkg: test
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
	rm -rf prep build test $(SourceDir)

distclean: clean pkgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(Source)

pmdoc:
	$(create_pmdoc)
	$(sanitize_pmdoc)

wiki:
	env Name="$(Name)" PkgFile="$(PkgFile)" \
		Description="$(shell head -1 Description)" \
		../../Library/mkwikipage.py

upload: pkg
	@$(call info_color,Sending $(PkgFile))
	hg tag -f $(DistName)-$(Version)-$(Revision)
	../../Library/googlecode_upload.py -p rudix -s "$(Title)" -d Description -l $(RUDIX_LABELS) $(PkgFile)
	twitter -erudix4mac set "$(Title): $(DistName)-$(Version)-$(Revision) http://code.google.com/p/rudix/downloads/detail?name=$(PkgFile)"
	@$(call info_color,Finished)

help:
	@echo "Construction rules:"
	@echo "  retrieve - Retrieve source to compile"
	@echo "  prep - After retrieve, prepare source to compile"
	@echo "  build - After prep, build source code"
	@echo "  install - After built, install into a temporary directory"
	@echo "  test - After installed, run tests"
	@echo "  pkg - After installed and tested, create package"
	@echo "Clean-up rules:"
	@echo "  clean - Clean up until retrieve"
	@echo "  distclean - After clean, remove config.cache and package"
	@echo "  realdistclean - After distclean, remove source"

.PHONY: buildclean installclean pkgclean clean distclean realdistclean sanitizepmdoc wiki upload help

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

define sanitize_pmdoc
for x in $(Name).pmdoc/*-contents.xml ; do \
	perl -p -i -e 's/o="$(USER)"/o="root"/' $$x ; done
for x in $(Name).pmdoc/*.xml ; do \
	xmllint --format --output $$x $$x ; done
endef

define configure
./configure $(ConfigureExtra) \
	--prefix=$(Prefix)
endef

define gnu_configure
./configure $(GnuConfigureExtra) \
	--prefix=$(Prefix) \
	--mandir=$(ManDir) \
	--infodir=$(InfoDir) \
	$(if $(RUDIX_DISABLE_DEPENDENCY_TRACKING),--disable-dependency-tracking) \
	$(if $(RUDIX_SAVE_CONFIGURE_CACHE),--cache-file=$(PortDir)/config.cache)
endef

define make
$(MAKE) $(MakeFlags)
endef

define verify_universal
lipo $1 -verify_arch i386 x86_64 || $(call warning_color,file $1 is not an Universal Binary)
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
$(sanitize_pmdoc)
$(create_pkg)
endef
