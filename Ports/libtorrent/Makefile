BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libsigc-2.0.la

include ../../Library/GNU.mk

Title=		libTorrent
Name=		libtorrent
Version=	0.13.2
Revision=	0
URL=		http://libtorrent.rakshasa.no/downloads/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-kqueue
GnuConfigureExtra += --with-openssl

EnvExtra += OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto
EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
