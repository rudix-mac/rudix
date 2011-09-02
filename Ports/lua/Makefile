include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		Lua
Name=		lua
Version=	5.1.4
Revision=	6
URL=		http://www.lua.org/ftp/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

MakeExtra += macosx MYLDFLAGS="$(LdFlags)"
MakeInstallExtra += INSTALL_TOP=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(PortDir)/$(InstallDir)$(ManDir)/man1

define install_post_hook
install -d $(PortDir)/$(InstallDir)$(LibDir)/pkgconfig
install -m 644 $(SourceDir)/etc/lua.pc $(PortDir)/$(InstallDir)$(LibDir)/pkgconfig/lua.pc
install -m 644 $(SourceDir)/doc/* $(PortDir)/$(InstallDir)/$(DocDir)/$(Name)
endef

define test_post_hook
otool -L $(InstallDir)$(BinDir)/lua | grep libedit
endef
