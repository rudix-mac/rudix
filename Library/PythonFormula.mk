# PythonFormula.mk - Pyhton Formula
#
# Copyright (c) 2011-2013 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada
#

#
# Select Python version
#
ifeq ($(OSXVersion),10.8)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.7)
Python = /usr/bin/python2.7
PythonSitePackages = /Library/Python/2.7/site-packages
else ifeq ($(OSXVersion),10.6)
Python = /usr/bin/python2.6
PythonSitePackages = /Library/Python/2.6/site-packages
else
Python = /usr/bin/python2.5
PythonSitePackages = /Library/Python/2.5/site-packages
endif

define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" \
	CXXFLAGS="$(CxxFlags)" \
	LDFLAGS="$(LdFlags)" \
	ARCHFLAGS="$(ArchFlags)" $(EnvExtra) \
$(Python) setup.py build $(SetupExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(Python) setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(PortDir)/$(InstallDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages)
cd $(BuildDir) ; \
$(Python) -m compileall -d / $(PortDir)/$(InstallDir)
$(install_base_documentation)
endef

define test_build
cd $(BuildDir) ; $(Python) setup.py test || $(call error_color,One or more tests failed)
endef

buildclean:
	cd $(BuildDir) ; $(Python) setup.py clean
	rm -f build
