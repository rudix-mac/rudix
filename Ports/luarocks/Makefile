include ../../Library/Configure.mk

BuildRequires += $(BinDir)/lua	# lua

Title=		LuaRocks
Name=		luarocks
Version=	3.7.0
Site=		https://luarocks.org/
Source=		https://luarocks.org/releases/luarocks-$(Version).tar.gz
License=        MIT

ReadMeFile=	$(SourceDir)/README.md

define after_install_hook
mv $(DestDir)$(SysConfDir)/luarocks/config-5.4.lua \
	$(DestDir)$(SysConfDir)/luarocks/config-5.4.lua.default
endef

define test_hook
$(BinDir)/luarocks --version | grep $(Version)
endef
