# UnixFormula.mk - Standard build with make.
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

define build_inner_hook
cd $(BuildDir) ; $(gnu_make) $(GnuMakeExtra) \
	CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"
endef

define install_inner_hook
cd $(BuildDir) ; $(gnu_make) \
	DESTDIR="$(PortDir)/$(InstallDir)" $(GnuMakeInstallExtra) install
$(install_base_documentation)
endef

define test_inner_hook
$(test_universal)
endef
