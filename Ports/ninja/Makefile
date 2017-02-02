include ../../Library/Rudix.mk

Title=		Ninja Build System
Name=		ninja
Version=	1.5.3
Site=		http://martine.github.com/ninja/
Source=		https://github.com/martine/ninja/archive/v$(Version).tar.gz
License=	Apache License

define build_hook
cd $(BuildDir) && ./bootstrap.py
endef

define install_hook
install -d $(PortDir)/$(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/ninja $(PortDir)/$(InstallDir)/$(BinDir)
$(install_base_documentation)
endef

define test_hook
cd $(BuildDir) && ./ninja
endef
