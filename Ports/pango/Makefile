# Requires xz to uncompress the source

include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libglib-2.0.la # static-glib

Title=		Pango
Name=		pango
Version=	1.42.4
Site=		https://www.pango.org/
Source=		https://download.gnome.org/sources/pango/1.42/$(Name)-$(Version).tar.xz
License=	LGPL

GnuConfigureExtra += --without-xft
GnuConfigureExtra += --disable-installed-tests

define prep_post_hook
patch -p0 < patches/pango-no-tests.diff
patch -p1 -d $(BuildDir) < patches/pango_font_size.diff
endef
