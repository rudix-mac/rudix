include ../../Library/Rudix.mk

Title=		ninja
Name=		ninja
Version=	120715
Revision=	1
Site=		http://martine.github.com/ninja/
URL=		git://github.com/martine
Source=		ninja.git
License=	Apache License

define retrieve_inner_hook
git clone $(URL)/$(Source) $(SourceDir)
endef

define prep_inner_hook
$(apply_patches)
endef

define build_inner_hook
cd $(BuildDir) ; ./bootstrap.py
endef

define install_inner_hook
install -d $(PortDir)/$(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/ninja $(PortDir)/$(InstallDir)/$(BinDir)
$(install_base_documentation)
endef

define test_inner_hook
cd $(BuildDir) ; ./ninja
endef
