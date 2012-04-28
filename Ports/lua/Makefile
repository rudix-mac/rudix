include ../../Library/Unix.mk

Title=		Lua
Name=		lua
Version=	5.2.0
Revision=	1
URL=		http://www.lua.org/ftp/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	license.txt

MakeExtra += macosx MYLDFLAGS="$(LdFlags)"
MakeInstallExtra += INSTALL_TOP=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(PortDir)/$(InstallDir)$(ManDir)/man1

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(PortDir)/$(InstallDir)/$(DocDir)/$(Name)
endef

define check_post_hook
otool -L $(InstallDir)$(BinDir)/lua | grep libedit
endef
