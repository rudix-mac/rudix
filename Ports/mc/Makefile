include ../../Library/GNU.mk

BuildRequires += $(BinDir)/pkg-config		# pkg-config
BuildRequires += $(LibDir)/libintl.la		# gettext
BuildRequires += $(LibDir)/libglib-2.0.la	# glib
BuildRequires += $(LibDir)/libgmodule-2.0.la	# glib

Title=		Midnight Commander
Name=		mc
Version=	4.8.23
Site=		http://www.midnight-commander.org/
#Source=	http://www.midnight-commander.org/downloads/$(Name)-$(Version).tar.bz2
Source=		http://ftp.midnight-commander.org/$(Name)-$(Version).tar.xz
License=	GPLv3

#GnuConfigureExtra += --with-included-gettext
GnuConfigureExtra += --with-screen=ncurses
GnuConfigureExtra += --without-x
#GnuConfigureExtra += --enable-vfs-smb
#GnuConfigureExtra += --with-glib-static # Bogus?

define fetch
curl -f -O -C - -L -k
endef

define after_install_hook
for f in FAQ HACKING TODO; do \
    install -m 644 $(SourceDir)/doc/$$f $(InstallDir)/$(DocDir)/$(Name); \
done
mv $(InstallDir)$(Prefix)/etc/mc $(InstallDir)$(Prefix)/etc/mc.default
install -d $(InstallDir)/$(Prefix)/etc/mc
endef

define test_hook
$(BinDir)/mc --version | grep $(Version)
endef
