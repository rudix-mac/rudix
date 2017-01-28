#
# Unix Formula.
#
# Copyright © 2011-2017 Rudá Moura (Rudix)
# Authors: Ruda Moura, Leonardo Santagada
#

MakeExtra = CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)"
MakeExtra += CPPFLAGS="$(CppFlags)" LDFLAGS="$(LdFlags)"

define build_inner_hook
cd $(BuildDir) && \
$(make) $(MakeExtra)
endef

define install_inner_hook
cd $(BuildDir) && \
$(make_install) DESTDIR="$(DestDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(strip_macho)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && $(MAKE) test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(MAKE) clean || $(call warning_color,Cannot clean)
	rm -f build check
