#BuildRequires += /usr/local/lib/libapr-1.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		APR-util
Name=		apr-util
Version=	1.4.1
Revision=	0
URL=		http://www.apache.org/dist/apr/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

GnuConfigureExtra += --with-apr=/usr/bin/apr-1-config
