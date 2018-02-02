#
# The Rudix BuildSystem itself.
#
# Copyright © 2005-2018 Rudix
# Authors: Rudá Moura, Leonardo Santagada
#

BuildSystem = 2018

# Get user preferences (if defined)
-include ~/.rudix.conf

System = $(shell uname)
Arch = $(shell sysctl -n hw.machine)
NumCPU = $(shell sysctl -n hw.ncpu)

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
ResourcesDir = $(Name)-resources
DestDir= $(PortDir)/$(InstallDir)
ReadMeFile = $(SourceDir)/README
LicenseFile = $(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_STATIC),yes)
RUDIX_BUILD_STATIC_LIBS=yes
DistName = static-$(Name)
else
DistName = $(Name)
endif

#
# Install dir options
#
Prefix        = /usr/local
BinDir        = $(Prefix)/bin
SBinDir       = $(Prefix)/sbin
IncludeDir    = $(Prefix)/include
LibDir        = $(Prefix)/lib
LibExecDir    = $(Prefix)/libexec
SysConfDir    = $(Prefix)/etc
LocalStateDir = $(Prefix)/var
DataDir       = $(Prefix)/share
DocDir        = $(DataDir)/doc
ManDir        = $(DataDir)/man
InfoDir       = $(DataDir)/info
ExamplesDir   = $(DataDir)/examples

#
# Safe language options
#
EnvExtra = LANG=C LC_ALL=C

#
# Framework (hooks)
#

all: pkg

# Retrieve source
retrieve:
	@$(call info_color,*** Retrieving $(Source) ***)
	@$(call retrieve_pre_hook)
	@$(call retrieve_hook)
	@$(call retrieve_post_hook)
	@$(call info_color,*** Done retrieve ***)
	@touch $@

# Prepare source to compile
prep: retrieve $(PrepRequires)
	@$(call info_color,*** Preparing $(DistName) ***)
	@$(call prep_pre_hook)
	@$(call prep_hook)
	@$(call prep_post_hook)
	@$(call info_color,*** Done prep ***)
	@touch $@

# Build source
build: prep $(BuildRequires)
	@$(call info_color,*** Building $(DistName) ***)
	@$(call build_pre_hook)
	@$(call build_hook)
	@$(call build_post_hook)
	@$(call info_color,*** Done build ***)
	@touch $@

# Check build
check: build
	@$(call info_color,*** Checking $(DistName) ***)
	@$(call check_pre_hook)
	@$(call check_hook)
	@$(call check_post_hook)
	@$(call info_color,*** Done check ***)
	@touch $@

# Install into a temporary directory
install: build
	@$(call info_color,*** Installing $(DistName) ***)
	@$(call install_pre_hook)
	@$(call install_hook)
	@$(call install_post_hook)
	@$(call info_color,*** Done install ***)
	@touch $@

# Create package
pkg: install
	@$(call info_color,*** Packing $(PkgFile) ***)
	@$(call pkg_pre_hook)
	@$(call pkg_hook)
	@$(call pkg_post_hook)
	@$(call info_color,*** Done pkg ***)
	@touch $@

# Run all tests
test: pkg check
	@$(call info_color,*** Testing $(DistName) and $(PkgFile) ***)
	@$(call test_pre_hook)
	@$(call test_hook)
	@$(call test_post_hook)
	@$(call info_color,*** Done test ***)
	@touch $@

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg $(ResourcesDir)

clean: installclean
	rm -rf prep build check test $(SourceDir) *~

distclean: clean pkgclean
	rm -f config.cache

realdistclean: distclean
	rm -f retrieve $(shell basename $(Source))

static: prep installclean buildclean
	$(MAKE) RUDIX_BUILD_STATIC=yes pkg

help:
	@echo "Rudix buildsystem options."
	@echo
	@echo "Port phase rules"
	@echo "  retrieve - Retrieve source from the Internet"
	@echo "  prep     - Prepare and uncompress source"
	@echo "  build    - Build port from shource"
	@echo "  check    - Check build (run internal tests)"
	@echo "  install  - Install into a temporary directory"
	@echo "  pkg      - Create package for distribution"
	@echo "  test     - Run tests (install package and run more test)"
	@echo
	@echo "Clean-up rules:"
	@echo "  clean - Clean but keep package"
	@echo "  distclean - Clean package and original source"
	@echo "  realdistclean - Clean up everything"
	@echo
	@echo "Other rules:"
	@echo "  help - This help message"
	@echo "  about - Display information about the port"
	@echo "  json - Display information in JSON format"
	@echo "  static - Create package with static libraries"

about:
	@$(call info_color,*** $(Name)-$(Version) ***)
	@echo "Title: $(Title)"
	@echo "Name: $(Name)"
	@echo "Version: $(Version)"
	@echo "Site: $(Site)"
	@echo "License: $(License)"
	@echo "Source: $(Source)"

json:

	@echo "{ \"title\": \"$(Title)\","
	@echo "  \"name\": \"$(Name)\","
	@echo "  \"version\": \"$(Version)\","
	@echo "  \"site\": \"$(Site)\","
	@echo "  \"license\": \"$(License)\","
	@echo "  \"source\": \"$(Source)\" }"

#
# Functions
#

define info_color
if test -t 1 ; then \
printf "\033[32m$1\033[0m\n" ; \
else \
printf "$1\n" ; \
fi
endef

define warning_color
if test -t 1 ; then \
printf "\033[33mWarning: $1\033[0m\n" ; \
else \
printf "$1\n" ; \
fi
endef

define error_color
if test -t 1 ; then \
printf "\033[31mError: $1\033[0m\n" ; \
else \
printf "$1\n" ; \
fi
endef

define fetch
curl \
	--fail \
	--location \
	--continue-at - \
	--remote-time \
	--remote-name
endef

define verify_checksum
if test -f checksum ; then \
	shasum --warn --check checksum ; \
fi
endef

define uncompress_source
case `file -b --mime-type $(shell basename $(Source))` in \
	application/x-tar) tar xf $(shell basename $(Source)) ;; \
	application/x-gzip) tar zxf $(shell basename $(Source)) ;; \
	application/x-bzip2) tar jxf $(shell basename $(Source)) ;; \
	application/x-xz) tar zxf $(shell basename $(Source)) || unxz -c $(shell basename $(Source)) | tar xf - ;; \
	application/zip) unzip -q $(shell basename $(Source)) ;; \
	application/x-lzip) lunzip -c $(shell basename $(Source)) | tar xf - ;; \
	*) $(call error_color,Unknown compression type) && false ;; \
esac
endef

define apply_patches
for x in $(wildcard *.patch patches/*.patch) ; do \
	patch -p0 -d $(SourceDir) < $$x ; done
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

#
# Common inner hooks
#

define retrieve_hook
$(fetch) $(FetchExtra) $(Source)
endef

define prep_hook
$(verify_checksum)
$(uncompress_source)
mv -v $(UncompressedName) $(SourceDir)
$(apply_patches)
endef

.PHONY: buildclean installclean pkgclean clean distclean realdistclean help about
