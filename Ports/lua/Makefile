include ../../Library/Unix.mk

Title=		Lua
Name=		lua
Version=	5.2.2
Revision=	0
#URL=		http://www.lua.org/ftp/
URL=		http://www.lua.org/work/
Source=		$(Name)-$(Version)-rc1.tar.gz

LicenseFile=	license.txt

MakeExtra += macosx MYLDFLAGS="$(LdFlags)"
MakeInstallExtra += INSTALL_TOP=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(PortDir)/$(InstallDir)$(ManDir)/man1

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(PortDir)/$(InstallDir)/$(DocDir)/$(Name)
endef

define check_post_hook
otool -L $(InstallDir)/$(BinDir)/lua | grep libedit
endef

define test_inner_hook
$(BinDir)/lua -v | grep $(Version)
endef
