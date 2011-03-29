BuildSystem = 20110328

Vendor = org.rudix
UncompressedName = $(Name)-$(Version)
PortDir := $(shell pwd)
BuildDir = $(Name)-build
InstallDir = $(Name)-install

#
# Build flags options
#
Arch = $(shell arch)
NumCPU = $(shell sysctl -n hw.ncpu)
ifdef RUDIX_UNIVERSAL
ArchFlags = -arch i386 -arch x86_64
else
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
LibDir = $(Prefix)/lib
DocDir = $(Prefix)/share/doc
ManDir = $(Prefix)/share/man
InfoDir = $(Prefix)/share/info

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

build: prep
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

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg

clean: installclean
	rm -rf prep build pmdoc test $(BuildDir)

distclean: clean pkgclean
	rm -f config.cache*

realdistclean: distclean
	rm -f retrieve $(Source)

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
printf "\033[31mError: $1\031[0m\n"
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
	patch -d $(BuildDir) < $$x ; done
endef

define pkgmaker
/Developer/usr/bin/packagemaker
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

define retrieve_inner_hook
$(fetch) $(URL)/$(Source)
endef

define prep_inner_hook
$(explode)
mv -v $(UncompressedName) $(BuildDir)
$(apply_patches)
endef

define verify_universal
lipo $1 -verify_arch i386 x86_64 || $(call warning_color,file $1 is not an Universal Binary)
endef

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
@$(call info_color,Done)
endef

#
# Formulas
#
ifdef RUDIX_GNU_FORMULA
define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" \
$(gnu_configure)
cd $(BuildDir) ; $(gnu_make) $(GnuMakeExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(gnu_make) install DESTDIR="$(PortDir)/$(InstallDir)" $(GnuMakeInstallExtra)
endef

define test_inner_hook
$(if $(RUDIX_UNIVERSAL),$(call test_universal))
cd $(BuildDir) ; $(gnu_make) check
endef
endif

ifdef RUDIX_PYTHON_FORMULA
# FIXME
endif
