include ../../Library/GNU.mk
BuildRequires += $(LibDir)/libintl.la # static-gettext

Title=		Fontconfig
Name=		fontconfig
Version=	2.13.0
Site=		https://www.freedesktop.org/wiki/Software/fontconfig/
Source=		https://www.freedesktop.org/software/fontconfig/release/$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra +=--disable-docs

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

# define test_hook
# $(BinDir)/gnuplot --version | grep $(Version)
# endef
