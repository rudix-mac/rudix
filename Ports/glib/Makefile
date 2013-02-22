# Requires xz to extract source

include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libintl.la

Title=		GLib
Name=		glib
Version=	2.33.2
Revision=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.33
Source=		$(Name)-$(Version).tar.xz


ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

EnvExtra += LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L/usr/local/lib -lffi"
