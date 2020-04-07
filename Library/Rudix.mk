#
# The Rudix BuildSystem itself.
#
# Copyright © 2005-2019 Rudix (Rudá Moura)
# Authors: Rudá Moura, Leonardo Santagada
#

BuildSystem = 1.6.0

# Get user preferences (if defined)
-include ~/.rudix.conf

System = $(shell uname)
Arch = $(shell sysctl -n hw.machine)
NumCPU = $(shell sysctl -n hw.ncpu)

RUDIX_QUIET?=no
RUDIX_SAVE_CONFIGURE_CACHE?=yes
RUDIX_STRIP_PACKAGE?=yes
RUDIX_ENABLE_NLS?=yes
RUDIX_PARALLEL_EXECUTION?=yes
RUDIX_RUN_ALL_TESTS?=yes

RUDIX_MSG_RETRIEVE?=Retrieving source from '$(Source)'
RUDIX_MSG_PREP?=Preparing '$(Name)' to build on '$(SourceDir)'
RUDIX_MSG_BUILD?=Building '$(Name)' from '$(BuildDir)'
RUDIX_MSG_CHECK?=Checking '$(Name)' from '$(BuildDir)'
RUDIX_MSG_INSTALL?=Installing '$(Name)' into '$(InstallDir)'
RUDIX_MSG_PKG?=Packing '$(PkgFile)' from '$(InstallDir)'
RUDIX_MSG_TEST?=Testing '$(PkgFile)'
RUDIX_MSG_DONE?=Done!

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
	@$(call info_color,$(RUDIX_MSG_RETRIEVE))
	@$(call before_retrieve_hook)
	@$(call retrieve_hook)
	@$(call after_retrieve_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Prepare source to compile
prep: retrieve
	@$(call info_color,$(RUDIX_MSG_PREP))
	@$(call before_prep_hook)
	@$(call prep_hook)
	@$(call after_prep_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Build source
build: prep
	@$(call info_color,$(RUDIX_MSG_BUILD))
	@$(call before_build_hook)
	@$(call build_hook)
	@$(call after_build_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Check build
check: build
	@$(call info_color,$(RUDIX_MSG_CHECK))
	@$(call before_check_hook)
	@$(call check_hook)
	@$(call after_check_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Install into a temporary directory
install: build
	@$(call info_color,$(RUDIX_MSG_INSTALL))
	@$(call before_install_hook)
	@$(call install_hook)
	@$(call after_install_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Create package
pkg: install
	@$(call info_color,$(RUDIX_MSG_PKG))
	@$(call before_pkg_hook)
	@$(call pkg_hook)
	@$(call after_pkg_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

# Run all tests
test: pkg check
	@$(call info_color,$(RUDIX_MSG_TEST))
	@$(call before_test_hook)
	@$(call test_hook)
	@$(call after_test_hook)
	@$(call info_color,$(RUDIX_MSG_DONE))
	@touch $@

installclean:
	rm -rf install $(InstallDir)

pkgclean:
	rm -rf pkg *.pkg $(ResourcesDir)

clean: installclean
	rm -rf prep build check test $(SourceDir) *~

distclean: clean pkgclean
	rm -f config.cache

realclean: distclean
	rm -f retrieve $(shell basename $(Source))
	rm -f $(foreach file,$(Files),$(shell basename $(file)))

help:
	@echo "Rudix buildsystem $(BuildSystem) options."
	@echo
	@echo "Stages (a.k.a. hooks, phases, etc.):"
	@echo "  retrieve - Retrieve source from the Internet"
	@echo "  prep     - Prepare and uncompress the source"
	@echo "  build    - Build port from the source"
	@echo "  check    - Check build -- run source's tests"
	@echo "  install  - Install into a temporary directory (for packing)"
	@echo "  pkg      - Create package for distribution"
	@echo "  test     - Run tests -- install package and run tests"
	@echo
	@echo "Clean-up:"
	@echo "  clean     - Clean but keep package"
	@echo "  distclean - Clean package and original source"
	@echo "  realclean - Clean up everything"
	@echo
	@echo "Other:"
	@echo "  help       - This help message"
	@echo "  about      - Display information about the port"

about:
	@echo "Title:   $(Title)"
	@echo "Name:    $(Name)"
	@echo "Version: $(Version)"
	@echo "Site:    $(Site)"
	@echo "Source:  $(Source)"
	@echo "License: $(License)"

#
# Functions
#

define info_color
if test -t 1 ; then \
	printf "\033[34mRudix: Info: $1\033[0m\n" ; \
else \
	printf "Rudix: Info: $1\n" ; \
fi
endef

define success_color
if test -t 1 ; then \
	printf "\033[32mRudix: Success: $1\033[0m\n" ; \
else \
	printf "Rudix: Success: $1\n" ; \
fi
endef

define warning_color
if test -t 1 ; then \
	printf "\033[33mRudix: Warning: $1\033[0m\n" ; \
else \
	printf "Rudix: Warning: $1\n" ; \
fi
endef

define error_color
if test -t 1 ; then \
	printf "\033[31mRudix: Error: $1\033[0m\n" ; \
else \
	printf "Rudix: Error:$1\n" ; \
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

ifeq ($(RUDIX_QUIET),yes)
FetchExtra+=--silent
endif

define verify_preprequires
for x in $(PrepRequires) ; do \
	test -f $$x && $(call success_color,Found $$x) \
	|| $(call error_color,Preparation requires $$x) ; done
endef

define verify_buildrequires
for x in $(BuildRequires) ; do \
	test -f $$x && $(call success_color,Found $$x) \
	|| $(call error_color,Build requires $$x) ; done
endef

define verify_buildsuggests
for x in $(BuildSuggests) ; do \
	test -f $$x && $(call success_color,Found $$x) \
	|| $(call warning_color,Build suggests $$x) ; done
endef

define uncompress_source
echo $(shell basename $(Source)); \
echo `file -b --mime-type $(shell basename $(Source))`; \
case `file -b --mime-type $(shell basename $(Source))` in \
	application/x-tar) tar xf $(shell basename $(Source)) ;; \
application/x-gzip) tar zxf $(shell basename $(Source)) ;; \
application/gzip) tar zxf $(shell basename $(Source)) ;; \
	application/x-bzip2) tar jxf $(shell basename $(Source)) ;; \
	application/x-xz) tar zxf $(shell basename $(Source)) || unxz -c $(shell basename $(Source)) | tar xf - ;; \
	application/zip) unzip -q $(shell basename $(Source)) ;; \
	application/x-lzip) lunzip -c $(shell basename $(Source)) | tar xf - ;; \
	*) $(call error_color,Unknown compression type) && false ;; \
esac
endef

PatchLevel=-p0
#
# paaguti: make patch order reproducible
#
# Read http://docs.electric-cloud.com/accelerator_doc/8_1/Mobile/eMake/Advanced/Content/emake%20Guide/5_Make_Compatibility/8_Wildcard_Sort_Order.htm
#
define apply_patches
for x in $(sort $(wildcard *.diff patches/*.diff *.patch patches/*.patch)) ; do \
	patch $(PatchLevel) -d $(SourceDir) < $$x ; done
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
for x in $(Documentation) ; do \
	cp -Rpv $$x $(DestDir)$(DocDir)/$(Name) ; \
done
endef

define install_examples
for x in $(Examples) ; do \
	install -d $(DestDir)$(ExamplesDir)/$(Name) ; \
	cp -Rpv $$x $(DestDir)$(ExamplesDir)/$(Name) ; \
done
endef

define test_documentation
@$(call info_color,Testing documentation)
test -d $(InstallDir)/usr/local/man && $(call error_color,Manual pages found in old /usr/local/man/ place) || true
test -d $(InstallDir)/usr/local/info && $(call error_color,Info pages found in old /usr/local/info/ place) || true
endef

define fetch_sources
$(fetch) $(FetchExtra) $(Source)
for x in $(Files) ; do \
	$(call info_color,Retrieving $$x) ; \
	$(fetch) $(FetchExtra) $$x ; \
done
endef

#
# Common inner hooks
#

define retrieve_hook
$(fetch_sources)
endef

define before_prep_hook
$(verify_preprequires)
endef

define prep_hook
$(uncompress_source)
mv -v $(UncompressedName) $(SourceDir)
$(apply_patches)
endef

define before_build_hook
$(verify_buildrequires)
$(verify_buildsuggests)
endef

.PHONY: buildclean installclean pkgclean clean distclean realclean help about
