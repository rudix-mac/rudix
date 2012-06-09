BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GLib
Name=		compat-glib
Version=	2.28.8
Revision=	1
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/
Source=		glib-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = glib-$(Version)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
