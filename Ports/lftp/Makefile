BuildRequires += $(LibDir)/libintl.la
BuildRequires += $(LibDir)/libreadline.a

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	LFTP is sophisticated ftp/http client, file transfer program supporting a number of network protocols
Site=		http://lftp.yar.ru/
License=	GPLv3
Title=		LFTP
Name=		lftp
Version=	4.2.3
Revision=	0
URL=		http://ftp.yars.free.net/pub/source/lftp
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --with-modules

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libreadline.a
define prep_post_hook
perl -p -i -e s/'-lreadline'//g $(SourceDir)/configure
endef
endif

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,FEATURES,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)/$(Prefix)/etc/lftp.conf $(InstallDir)/$(Prefix)/etc/lftp.conf.default
endef
