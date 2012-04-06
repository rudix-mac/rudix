BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(LibDir)/libglib-2.0.la
BuildRequires += $(LibDir)/libgmodule-2.0.la

include ../../Library/GNU.mk

Title=		Midnight Commander
Name=		mc
Version=	4.8.2
Revision=	0
URL=		http://www.midnight-commander.org/downloads/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

#GnuConfigureExtra += --with-included-gettext
GnuConfigureExtra += --with-screen=ncurses
GnuConfigureExtra += --with-x
#GnuConfigureExtra += --enable-vfs-smb

define fetch
curl -f -O -C - -L -k
endef

define install_post_hook
install -m 644 $(SourceDir)/doc/{FAQ,HACKING,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)$(Prefix)/etc/mc $(InstallDir)$(Prefix)/etc/mc.default
install -d $(InstallDir)/$(Prefix)/etc/mc
endef

define final_post_hook
/usr/local/bin/mc --version
endef
