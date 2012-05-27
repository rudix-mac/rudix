BuildRequires += $(LibDir)/libtorrent.la # static-libtorrent
BuildRequires += $(LibDir)/libsigc-2.0.la # static-libsigcpp

include ../../Library/GNU.mk

Title=		rTorrent
Name=		rtorrent
Version=	0.9.2
Revision=	0
URL=		http://libtorrent.rakshasa.no/downloads/
Source=		$(Name)-$(Version).tar.gz

EnvExtra += PKG_CONFIG_PATH="/usr/lib/pkgconfig"

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define final_inner_hook
$(BinDir)/rtorrent -h
endef
