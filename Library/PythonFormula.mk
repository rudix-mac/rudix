# PythonFormula.mk - Formula to build Python projects
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" ARCHFLAGS="$(ArchFlags)" $(EnvExtra) \
$(Python) setup.py build $(SetupExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(Python) setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(PortDir)/$(InstallDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages)
cd $(BuildDir) ; $(Python) -m compileall -d / $(PortDir)/$(InstallDir)
$(install_base_documentation)
endef

define test_inner_hook
$(call test_universal)
endef
