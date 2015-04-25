# Thanks fbl!

BuildRequires += $(LibDir)/libprotobuf.la # static-protobuf
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		Mobile Shell
Name=		mosh
Version=	1.2.4
Revision=	0
Site=		http://mosh.mit.edu/
Source=		http://mosh.mit.edu//$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYING

EnvExtra += OPENSSL_CFLAGS=-I/usr/include
EnvExtra += OPENSSL_LIBS=-lcrypto

define test_inner_hook
$(BinDir)/mosh --version 2>&1 | grep $(Version)
endef
