BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		Libsigc++
Name=		libsigcpp
Version=	2.2.10
Revision=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/
Source=		libsigc++-$(Version).tar.bz2


UncompressedName = libsigc++-$(Version)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
