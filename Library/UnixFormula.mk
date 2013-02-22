# Unix Formula
#
# Copyright (c) 2011-2013 Rudix
# Authors: Ruda Moura, Leonardo Santagada
#

define build_inner_hook
cd $(BuildDir) && \
$(make) $(MakeExtra) CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"
endef

define install_inner_hook
cd $(BuildDir) && \
$(make) DESTDIR="$(PortDir)/$(InstallDir)" $(MakeInstallExtra) install
$(install_base_documentation)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && $(make) test
endef
endif

buildclean:
	cd $(BuildDir) && $(make) clean
	rm -f build check
