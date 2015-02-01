include ../../Library/Unix.mk

Title=		Lua
Name=		lua
Version=	5.3.0
Revision=	0
Site=		http://www.lua.org/
Source=		http://www.lua.org/ftp/$(Name)-$(Version).tar.gz
Checksum=	1c46d1c78c44039939e820126b86a6ae12dadfba
License=	MIT

LicenseFile=	license.txt

OptFlags=
MakeExtra = MYCFLAGS="$(CFlags)" MYCXXFLAGS="$(CxxFlags)" MYLDFLAGS="$(LdFlags)"
MakeExtra += macosx
MakeInstallExtra += INSTALL_TOP=$(DestDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(DestDir)$(ManDir)/man1

define check_post_hook
otool -L $(BuildDir)/src/lua | grep libedit
nm $(BuildDir)/src/lua | grep _readline
endef

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(DestDir)$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/lua -v | grep $(Version)
endef
