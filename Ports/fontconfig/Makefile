include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libintl.la # gettext

Title=		Fontconfig
Name=		fontconfig
Version=	2.13.1
Site=		https://www.freedesktop.org/wiki/Software/fontconfig/
Source=		https://www.freedesktop.org/software/fontconfig/release/$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --disable-dependency-tracking
GnuConfigureExtra += --disable-silent-rules
GnuConfigureExtra += --disable-docs
GnuConfigureExtra += --enable-static
GnuConfigureExtra += --with-add-fonts=/System/Library/fonts,/Library/Fonts,~/Library/Fonts

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif
