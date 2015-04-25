BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libsigc-2.0.la # static-libsigcpp

include ../../Library/GNU.mk

Title=		libTorrent
Name=		libtorrent
Version=	0.13.2
Revision=	1
Site=		http://libtorrent.rakshasa.no/
Source=		http://libtorrent.rakshasa.no/downloads//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-kqueue
GnuConfigureExtra += --with-openssl

EnvExtra += OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto
EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
