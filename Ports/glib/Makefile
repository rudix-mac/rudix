# Requires xz to extract source
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		GLib
Name=		glib
Version=	2.42.2
Revision=	0
Site=		http://www.gtk.org/
Source=		http://ftp.gnome.org/pub/gnome/sources/glib/2.42/$(Name)-$(Version).tar.xz
License=	GPL

EnvExtra += LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L/usr/local/lib -lffi"

define test_inner_hook
$(BinDir)/gapplication version | grep $(Version)
endef
