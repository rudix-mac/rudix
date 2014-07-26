include ../../Library/Unix.mk

Title=		Lua
Name=		lua
Version=	5.2.3
Revision=	1
Site=		http://www.lua.org/
URL=		http://www.lua.org/ftp/
#URL=		http://www.lua.org/work/
Source=		$(Name)-$(Version).tar.gz
License=	MIT

LicenseFile=	license.txt

MakeExtra += macosx
MakeInstallExtra += INSTALL_TOP=$(DestDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(DestDir)$(ManDir)/man1

OptFlags=
define build_inner_hook
cd $(BuildDir) && \
$(make) $(MakeExtra) MYCFLAGS="$(CFlags)" MYCXXFLAGS="$(CxxFlags)" MYLDFLAGS="$(LdFlags)"
endef

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(DestDir)$(DocDir)/$(Name)
endef

define check_post_hook
otool -L $(InstallDir)$(BinDir)/lua | grep libedit
nm $(InstallDir)$(BinDir)/lua | grep _readline
endef

define test_inner_hook
$(BinDir)/lua -v | grep $(Version)
endef
