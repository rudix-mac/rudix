#
# Generic Configure Formula.
#
# Copyright © 2011-2014 Rudix
# Authors: Rudá Moura, Leonardo Santagada
#

define install_extra_documentation
for x in $(wildcard \
	$(BuildDir)/AUTHORS* \
	$(BuildDir)/ACKS* \
	$(BuildDir)/CHANGES* \
	$(BuildDir)/COPYING* \
	$(BuildDir)/CREDITS* \
	$(BuildDir)/NOTICE* \
	$(BuildDir)/README* \
	$(BuildDir)/INSTALL* \
	$(BuildDir)/NEWS* \
	$(BuildDir)/LICENSE* \
	$(BuildDir)/ChangeLog*) ; do \
	install -m 644 $$x $(DestDir)$(DocDir)/$(Name) ; \
done
rm -f $(InstallDir)/$(InfoDir)/dir
rm -f $(InstallDir)/$(LibDir)/charset.alias
rm -f $(InstallDir)/$(DataDir)/locale/locale.alias
endef

define build_inner_hook
$(call info_color,Running Configure)
cd $(BuildDir) && \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" $(EnvExtra) $(configure)
$(call info_color,Done)
cd $(BuildDir) && $(make) $(MakeExtra)
endef

define install_inner_hook
cd $(BuildDir) && \
$(MAKE) install DESTDIR="$(DestDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(install_extra_documentation)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && \
$(make) test check || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(make) clean || $(call warning_color,Cannot clean)
	rm -f build
