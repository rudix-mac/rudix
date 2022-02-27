include ../../Library/Unix.mk

Title=		Lua
Name=		lua
Version=	5.4.4
Site=		http://www.lua.org/
Source=		http://www.lua.org/ftp/$(Name)-$(Version).tar.gz
License=	MIT
LicenseFile=	license.txt
Documentation=	$(SourceDir)/doc/*

MakeExtra = MYCFLAGS="$(CFlags)" MYCXXFLAGS="$(CxxFlags)" MYLDFLAGS="$(LdFlags)"
MakeExtra += macosx
MakeInstallExtra += INSTALL_TOP=$(DestDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(DestDir)$(ManDir)/man1

define after_check_hook
otool -L $(BuildDir)/src/lua | grep libedit
nm $(BuildDir)/src/lua | grep _readline
endef

define test_hook
$(BinDir)/lua -v | grep $(Version)
endef
