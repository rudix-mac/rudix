BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(BinDir)/pkg-config # pkgconfig

include ../../Library/GNU.mk

Title=		GLib
Name=		glib
Version=	2.44.1
Site=		http://www.gtk.org/
Source=		http://ftp.gnome.org/pub/gnome/sources/glib/2.44/$(Name)-$(Version).tar.xz
License=	GPL

EnvExtra += LIBFFI_CFLAGS="-I/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L/usr/local/lib -lffi"

define test_hook
$(BinDir)/gapplication version | grep $(Version)
endef
