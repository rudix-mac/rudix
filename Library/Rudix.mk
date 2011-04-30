# Rudix.mk - The BuildSystem itself
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

BuildSystem = 20110422

Vendor = org.rudix
UncompressedName = $(Name)-$(Version)
PortDir := $(shell pwd)
SourceDir = $(Name)-build
BuildDir = $(SourceDir)
InstallDir = $(Name)-install
PkgFile = $(Name)-$(Version)-$(Revision).pkg

#
# Build flags options
#
Arch = $(shell arch)
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
# Python options
#
Python = /usr/bin/python2.6
PythonSitePackages = /Library/Python/2.6/site-packages

#
# Framework
#
all: install
retrieve:
	@$(call info_color,Retrieving)
	@$(call retrieve_pre_hook)
	@$(call retrieve_inner_hook)
	@$(call retrieve_post_hook)
	@$(call info_color,Finished)
	@touch retrieve

prep: retrieve
	@$(call info_color,Preparing)
	@$(call prep_pre_hook)
	@$(call prep_inner_hook)
	@$(call prep_post_hook)
	@$(call info_color,Finished)
	@touch prep

build: prep $(BuildRequires)
	@$(call info_color,Building)
	@$(call build_pre_hook)
	@$(call build_inner_hook)
	@$(call build_post_hook)
	@$(call info_color,Finished)
	@touch build

install: build
	@$(call info_color,Installing)
	@$(call install_pre_hook)
	@$(call install_inner_hook)
	@$(call install_post_hook)
	@$(call info_color,Finished)
	@touch install

test: install
	@$(call info_color,Testing)
	@$(call test_pre_hook)
	@$(call test_inner_hook)
	@$(call test_post_hook)
	@$(call info_color,Finished)
	@touch test

pkg: test
	@$(call info_color,Packing)
	@$(call pkg_pre_hook)
	@$(call pkg_inner_hook)
	@$(call pkg_post_hook)
	@$(call info_color,Finished)
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

ContentsXML = $(Name).pmdoc/01$(Name)-contents.xml
sanitizepmdoc:
	@$(call info_color,Cleaning $(ContentsXML))
	@sed 's_o="$(USER)"_o="root"_ ; \
	      s_pt="[^"]*"_pt="$(InstallDir)"_' $(ContentsXML)| \
	xmllint --format --output $(ContentsXML) -
	@head -n 10 $(ContentsXML)
	@$(call warning_color,check the snippet above)
	@$(call info_color,Finished)

upload: pkg
	@$(call info_color,Sending $(PkgFile))
	hg tag -f $(Name)-$(Version)-$(Revision)
	../../Library/googlecode_upload.py -p rudix -s "$(Title)" -d "$(Description)" -l 'Rudix-2011' $(PkgFile)
	twitter -erudix4mac set $(Title) $(Version) http://rudix.googlecode.com/files/$(PkgFile)
	@$(call info_color,Finished)

.PHONY: installclean pkgclean clean distclean realdistclean sanitizepmdoc upload

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
	--description "$(Description)" \
	--readme $(ReadMeFile) \
	--license $(LicenseFile) \
	.
endef

define create_pkg
/Developer/usr/bin/packagemaker \
	--doc $(Name).pmdoc \
	--id $(Vendor).pkg.$(Name) \
	--version $(Version)-$(Revision) \
	--title "$(Title) $(Version)" \
$(if $(wildcard $(PortDir)/scripts),--scripts $(PortDir)/scripts) \
	--out $(PortDir)/$(PkgFile)
endef

define gnu_configure
./configure $(GnuConfigureExtra) \
	--prefix=$(Prefix) \
	--mandir=$(ManDir) \
	--infodir=$(InfoDir) \
	$(if $(RUDIX_DISABLE_DEPENDENCY_TRACKING),--disable-dependency-tracking) \
	$(if $(RUDIX_SAVE_CONFIGURE_CACHE),--cache-file=$(PortDir)/config.cache)
endef

define gnu_make
make -j $(NumCPU)
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
@$(call info_color,Done)
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
$(call info_color,Done)
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
$(create_pmdoc)
$(strip_macho)
$(create_pkg)
endef
