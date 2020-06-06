include ../../Library/GNU.mk

Title=		GnuTLS
Name=		gnutls
Version=	3.6.13
Site=		https://gnutls.org
Source=		https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-$(Version).tar.xz
License=	LGPLv2.1+

GnuConfigureExtra += --with-included-libtasn1
GnuConfigureExtra += --disable-tools
GnuConfigureExtra += --disable-guile

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/doc/COPYING.LESSER
