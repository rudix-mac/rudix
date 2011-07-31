# PythonFormula.mk - Formula to build Python projects
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

#
# Python versions
#
Python = $(Python2.7)
PythonSitePackages = $(PythonSitePackages2.7)
Python2.7 = /usr/bin/python2.7
PythonSitePackages2.7 = /Library/Python/2.7/site-packages
Python2.6 = /usr/bin/python2.6
PythonSitePackages2.6 = /Library/Python/2.6/site-packages

define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" ARCHFLAGS="$(ArchFlags)" $(EnvExtra) \
$(Python2.6) setup.py build $(SetupExtra)
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" ARCHFLAGS="$(ArchFlags)" $(EnvExtra) \
$(Python2.7) setup.py build $(SetupExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(Python2.6) setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(PortDir)/$(InstallDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages2.6)
cd $(BuildDir) ; $(Python2.6) -m compileall -d / $(PortDir)/$(InstallDir)
cd $(BuildDir) ; \
$(Python2.7) setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(PortDir)/$(InstallDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages2.7)
cd $(BuildDir) ; $(Python2.7) -m compileall -d / $(PortDir)/$(InstallDir)
$(install_base_documentation)
endef

define test_inner_hook
$(call test_universal)
endef
