#
# CMake Hooks.
#
# Copyright © 2019 Rudix
# Author: Rudá Moura <ruda.moura@gmail.com>
#

BuildRequires += $(BinDir)/cmake

CMakeExtra += -DCMAKE_BUILD_TYPE=Release
CMakeExtra += -DCMAKE_INSTALL_PREFIX=$(Prefix)

define build_hook
cd $(BuildDir) && \
env $(EnvExtra) cmake $(CMakeExtra)
endef

define install_hook
cd $(BuildDir) && \
$(make_install) DESTDIR="$(DestDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(install_examples)
$(strip_macho)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_hook
cd $(BuildDir) && $(MAKE) test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(MAKE) clean || $(call warning_color,Cannot clean)
	rm -f build check
