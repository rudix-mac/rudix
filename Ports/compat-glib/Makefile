# Requires xz to extract source
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		GLib
Name=		compat-glib
Version=	2.32.4
Revision=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.32
Source=		glib-$(Version).tar.xz

UncompressedName=glib-$(Version)

EnvExtra += LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L/usr/local/lib -lffi"
