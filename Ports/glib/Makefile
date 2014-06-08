# Requires xz to extract source
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		GLib
Name=		glib
Version=	2.34.3
Revision=	0
Site=		http://www.gtk.org/
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.34
Source=		$(Name)-$(Version).tar.xz
License=	GPL

EnvExtra += LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L/usr/local/lib -lffi"
