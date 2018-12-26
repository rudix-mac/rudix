BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libpixman-1.la # static-pixman
BuildRequires += $(LibDir)/libpng.la
BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		Cairo
Name=		cairo
Version=	1.16.0
Site=		http://cairographics.org/
Source=		http://cairographics.org/releases/$(Name)-$(Version).tar.xz
License=	LGPL

EnvExtra += PKG_CONFIG_PATH="$(LibDir)/pkgconfig:/usr/X11R6/lib/pkgconfig"
GnuConfigureExtra += --with-html-dir=$(DocDir)/cairo
