include ../../Library/Configure.mk

Title=		Node.js®
Name=		node
Version=	0.12.2
Revision=	0
Site=		http://nodejs.org/
Source=		http://nodejs.org/dist/v$(Version)/$(Name)-v$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)-v$(Version)

EnvExtra += OPENSSL_CFLAGS=-I/usr/include
EnvExtra += OPENSSL_LIBS=-lcrypto

define test_inner_hook
$(BinDir)/node --version | grep $(Version)
$(BinDir)/npm --version | grep 2.7.4
endef
