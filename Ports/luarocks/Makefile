BuildRequires += $(BinDir)/lua	# lua

include ../../Library/Configure.mk

Title=		LuaRocks
Name=		luarocks
Version=	2.3.0
Revision=	0
Site=		https://luarocks.org/
Source=		http://keplerproject.github.io/luarocks/releases/luarocks-$(Version).tar.gz
License=        MIT

ReadMeFile=	$(SourceDir)/README.md

define install_post_hook
mv $(DestDir)$(SysConfDir)/luarocks/config-5.3.lua \
	$(DestDir)$(SysConfDir)/luarocks/config-5.3.lua.default
endef

define test_inner_hook
$(BinDir)/luarocks --version | grep $(Version)
endef
