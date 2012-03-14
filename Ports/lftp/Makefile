BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(LibDir)/libreadline.a

include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		LFTP
Name=		lftp
Version=	4.3.5
Revision=	0
URL=		http://ftp.yars.free.net/pub/source/lftp
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --with-modules

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libreadline.a
define prep_post_hook
perl -p -i -e s/'-lreadline'//g $(SourceDir)/configure
endef
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
endif

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,FEATURES,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)/$(Prefix)/etc/lftp.conf $(InstallDir)/$(Prefix)/etc/lftp.conf.default
endef
