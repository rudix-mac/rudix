include ../../Library/Config.mk
RUDIX_UNIVERSAL=
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		NodeJS
Name=		node
Version=	0.6.19
Revision=	0
URL=		http://my.package.com/
Source=		$(Name)-v$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = $(Name)-v$(Version)

EnvExtra += OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto
