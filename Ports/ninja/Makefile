# Ninja build system

include ../../Library/Custom.mk

Title=		Ninja
Name=		ninja
Version=	1.10.2
Site=		https://ninja-build.org
Source=		https://github.com/ninja-build/ninja/archive/v$(Version).tar.gz
License=	Apache License 2.0

ReadMeFile=	$(SourceDir)/README.md

define build_hook
cd $(BuildDir) && ./configure.py --bootstrap
endef

define install_hook
install -d $(PortDir)/$(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/ninja $(PortDir)/$(InstallDir)/$(BinDir)
$(install_base_documentation)
endef

define test_hook
cd $(BuildDir) && ./ninja --version | grep $(Version)
endef
