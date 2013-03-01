include ../../Library/Unix.mk
CFlags=
LdFlags=

Title=		Lua
Name=		compat-lua
Version=	5.1.5
Revision=	1
URL=		http://www.lua.org/ftp/
Source=		lua-$(Version).tar.gz

LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=lua-$(Version)

MakeExtra += macosx MYLDFLAGS="$(LdFlags)"
MakeInstallExtra += INSTALL_TOP=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL_MAN=$(PortDir)/$(InstallDir)$(ManDir)/man1

define install_post_hook
install -d $(PortDir)/$(InstallDir)$(LibDir)/pkgconfig
install -m 644 $(SourceDir)/etc/lua.pc $(PortDir)/$(InstallDir)$(LibDir)/pkgconfig/lua.pc
endef

define check_post_hook
otool -L $(InstallDir)/$(BinDir)/lua | grep libedit
endef

define test_inner_hook
$(BinDir)/lua -v
endef
