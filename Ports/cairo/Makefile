BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libpixman-1.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Vector graphics library
Site=		http://cairographics.org/
License=	LGPL
Name=		cairo
Version=	1.10.0
Revision=	0
URL=		http://www.cairographics.org/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

EnvExtra = PKG_CONFIG_PATH="$(LibDir)/pkgconfig:/usr/X11R6/lib/pkgconfig"
GnuConfigureExtra = --with-html-dir=$(DocDir)/cairo

#ifdef STATIC_ONLY
#CONFIG_OPTS=	--enable-static --disable-shared
#else
#CONFIG_OPTS=	--enable-static --enable-shared
#endif
