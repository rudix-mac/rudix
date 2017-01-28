BuildRequires += $(LibDir)/libtorrent.la # static-libtorrent
BuildRequires += $(LibDir)/libsigc-2.0.la # static-libsigcpp
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		rTorrent
Name=		rtorrent
Version=	0.9.2
Site=		http://libtorrent.rakshasa.no/
Source=		http://libtorrent.rakshasa.no/downloads//$(Name)-$(Version).tar.gz
License=	GPL

EnvExtra += libcurl_CFLAGS="-I/usr/include/curl" libcurl_LIBS="-lcurl"

define test_inner_hook
$(BinDir)/rtorrent -h
endef
