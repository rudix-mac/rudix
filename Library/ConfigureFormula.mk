#
# Generic Configure Formula.
#
# Copyright © 2011-2017 Rudá Moura (Rudix)
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
rm -f $(InstallDir)$(ManDir)/whatis
rm -f $(InstallDir)$(InfoDar)/dir
rm -f $(InstallDir)$(LibDir)/charset.alias
rm -f $(InstallDir)$(DataDir)/locale/locale.alias
endef

EnvExtra += CFLAGS="$(CFlags)" CPPFLAGS="$(CppFlags)"
EnvExtra += CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"

define build_hook
cd $(BuildDir) && env $(EnvExtra) $(configure) && $(make) $(MakeExtra)
endef

define install_hook
cd $(BuildDir) && \
$(make_install) DESTDIR="$(DestDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(install_extra_documentation)
$(strip_macho)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_hook
cd $(BuildDir) && \
$(MAKE) test check || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(MAKE) clean || $(call warning_color,Cannot clean)
	rm -f build
