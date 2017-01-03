include ../../Library/Configure.mk

Title=		Node.js®
Name=		node
Version=	7.2.1
Revision=	0
Site=		http://nodejs.org/
Source=		http://nodejs.org/dist/v$(Version)/$(Name)-v$(Version).tar.gz
Checksum=	228a0c2ff23294778f226e5d7fc85fc2e80a3cd1
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)-v$(Version)

EnvExtra += OPENSSL_CFLAGS=-I/usr/include
EnvExtra += OPENSSL_LIBS=-lcrypto

define test_inner_hook
$(BinDir)/node --version | grep $(Version)
$(BinDir)/npm --version | grep 3.10.9
endef
