include ../../Library/GNU.mk

Title=		GLib
Name=		glib
Version=	2.54.3
Site=		https://www.gtk.org
Source=		http://ftp.gnome.org/pub/gnome/sources/glib/2.54/glib-$(Version).tar.xz
License=	LGPLv2

BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libpcre.la # static-pcre

SdkPath = $(shell xcrun --sdk macosx --show-sdk-path)
EnvExtra += LIBFFI_CFLAGS="-I$(SdkPath)/usr/include/ffi"
EnvExtra += LIBFFI_LIBS="-L$(SdkPath)/usr/lib -lffi"

define test_hook
$(BinDir)/gapplication version | grep $(Version)
endef
