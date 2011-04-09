BuildRequires += /usr/local/lib/libapr-1.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://apr.apache.org/
License=	Apache License
Description=	Companion library to APR
Title=		APR-util
Name=		apr-util
Version=	1.3.10
Revision=	0
URL=		http://www.apache.org/dist/apr/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

#ifdef STATIC_ONLY
#CONFIG_OPTS=	--enable-static --disable-shared
#endif

GnuConfigureExtra += --with-apr=/usr/local/bin/apr-1-config
