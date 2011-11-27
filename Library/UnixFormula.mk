# UnixFormula.mk - Standard build with make.
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

define build_inner_hook
cd $(BuildDir) ; $(make) $(MakeExtra) \
	CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"
endef

define install_inner_hook
cd $(BuildDir) ; $(make) \
	DESTDIR="$(PortDir)/$(InstallDir)" $(MakeInstallExtra) install
$(install_base_documentation)
endef

define test_inner_hook
$(test_universal)
cd $(BuildDir) ; $(make) test
endef

buildclean:
	cd $(BuildDir) ; $(make) clean
	rm -f build
