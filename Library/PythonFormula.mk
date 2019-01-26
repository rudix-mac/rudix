#
# Python Formula.
#
# Copyright © 2011-2019 Rudá Moura (Rudix)
# Authors: Rudá Moura, Leonardo Santagada
#

EnvExtra += CFLAGS="$(CFlags)" \
	    CXXFLAGS="$(CxxFlags)" \
	    CPPFLAGS="$(CppFlags)" \
	    LDFLAGS="$(LdFlags)" \
	    ARCHFLAGS="$(ArchFlags)"

ifeq ($(RUDIX_QUIET),yes)
SetupExtra+=--quiet
endif

define build_hook
cd $(BuildDir) && \
env $(EnvExtra) $(Python) setup.py $(SetupExtra) build $(SetupBuildExtra)
endef

define install_hook
cd $(BuildDir) && \
$(Python) \
	setup.py $(SetupExtra) install $(SetupInstallExtra) \
	--no-compile \
	--root=$(DestDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages)
cd $(BuildDir) && $(Python) -m compileall -d / $(DestDir)
$(install_base_documentation)
$(install_examples)
$(strip_macho)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_hook
cd $(BuildDir) && \
$(Python) setup.py $(SetupExtra) test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	@cd $(BuildDir) && $(Python) setup.py $(SetupExtra) clean || $(call warning_color,Cannot clean)
	@rm -f build check
