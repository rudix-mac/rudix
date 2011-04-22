BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(LibDir)/libglib-2.0.la
BuildRequires += $(LibDir)/libgmodule-2.0.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Free Norton Commander clone with many useful features
Site=		http://www.midnight-commander.org/
License=	GPL
Title=		Midnight Commander
Name=		mc
Version=	4.7.5.2
Revision=	0
URL=		http://www.midnight-commander.org/downloads/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
LdFlags += -framework Carbon -framework CoreServices
EnvExtra += GLIB_CFLAGS="-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include"
EnvExtra += GLIB_LIBS="-L/usr/local/lib /usr/local/lib/libglib-2.0.a  -liconv"
EnvExtra += GMODULE_CFLAGS="-D_REENTRANT -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include"
EnvExtra += GMODULE_LIBS="-L/usr/local/lib /usr/local/lib/libgmodule-2.0.a /usr/local/lib/libglib-2.0.a -liconv"
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += --with-screen=ncurses

define install_post_hook
install -m 644 $(SourceDir)/doc/{FAQ,HACKING,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)$(Prefix)/etc/mc $(InstallDir)$(Prefix)/etc/mc.default
install -d $(InstallDir)/$(Prefix)/etc/mc
endef
