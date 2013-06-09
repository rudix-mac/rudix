include ../../Library/Unix.mk

Title=		Nice Editor
Name=		ne
Version=	2.5
Revision=	0
URL=		http://ne.dsi.unimi.it
Source=		$(Name)-$(Version).tar.gz

define build_inner_hook
cd $(BuildDir) && $(MAKE)
endef

define install_inner_hook
cd $(BuildDir) && $(MAKE) PREFIX="$(DestDir)/$(Prefix)" install
$(install_base_documentation)
rm -f $(InstallDir)/$(InfoDir)/dir
endef

define test_inner_hook
$(BinDir)/ne --help
endef
