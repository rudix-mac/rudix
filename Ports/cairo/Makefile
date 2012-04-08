BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libpixman-1.la

include ../../Library/GNU.mk

Title=		Cairo
Name=		cairo
Version=	1.12.0
Revision=	0
URL=		http://cairographics.org/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

EnvExtra+=PKG_CONFIG_PATH="$(LibDir)/pkgconfig:/usr/X11R6/lib/pkgconfig"
GnuConfigureExtra+=--with-html-dir=$(DocDir)/cairo

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra+=--enable-static --disable-shared
else
GnuConfigureExtra+=--enable-static --enable-shared
endif
