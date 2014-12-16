BuildRequires += $(BinDir)/pkg-config # comapt-pkg-config
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libglib-2.0.la # static-glib
BuildRequires += $(LibDir)/libgmodule-2.0.la # static-glib

include ../../Library/GNU.mk

Title=		Midnight Commander
Name=		mc
Version=	4.8.7
Revision=	0
Site=		http://www.midnight-commander.org/
URL=		http://www.midnight-commander.org/downloads/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

#GnuConfigureExtra += --with-included-gettext
GnuConfigureExtra += --with-screen=ncurses
GnuConfigureExtra += --without-x
#GnuConfigureExtra += --enable-vfs-smb
#GnuConfigureExtra += --with-glib-static # Bogus?

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv -framework CoreServices
endif

define fetch
curl -f -O -C - -L -k
endef

define install_post_hook
install -m 644 $(SourceDir)/doc/{FAQ,HACKING,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)$(Prefix)/etc/mc $(InstallDir)$(Prefix)/etc/mc.default
install -d $(InstallDir)/$(Prefix)/etc/mc
endef

define final_post_hook
$(BinDir)/mc --version | grep $(Version)
endef
