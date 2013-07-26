# Thanks fbl!

BuildRequires += $(LibDir)/libprotobuf.la # static-protobuf
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		Mobile Shell
Name=		mosh
Version=	1.2.4
Revision=	0
URL=		http://mosh.mit.edu/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYING

EnvExtra += OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto

define test_inner_hook
$(BinDir)/mosh --version ||  [ $$? == 255 ]
endef
