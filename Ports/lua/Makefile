include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		Lua
Name=		lua
Version=	5.2.0
Revision=	0
URL=		http://www.lua.org/ftp/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/doc/readme.html
LicenseFile=	license.html

MakeExtra += macosx MYLDFLAGS="$(LdFlags)"
MakeInstallExtra += INSTALL_TOP=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(PortDir)/$(InstallDir)$(ManDir)/man1

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(PortDir)/$(InstallDir)/$(DocDir)/$(Name)
endef

define test_post_hook
otool -L $(InstallDir)$(BinDir)/lua | grep libedit
endef
