#
# Unix Formula.
#
# Copyright © 2011-2014 Rudix
# Authors: Ruda Moura, Leonardo Santagada
#

define build_inner_hook
cd $(BuildDir) && \
$(make) $(MakeExtra) CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"
endef

define install_inner_hook
cd $(BuildDir) && \
$(MAKE) DESTDIR="$(DestDir)" $(MakeInstallExtra) install
$(install_base_documentation)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && $(make) test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(make) clean || $(call warning_color,Cannot clean)
	rm -f build check
