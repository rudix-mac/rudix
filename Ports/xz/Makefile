BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		XZ Utils
Name=		xz
Version=	5.2.4
Site=		http://tukaani.org/xz/
Source=		http://tukaani.org/xz//$(Name)-$(Version).tar.bz2
License=	GPLv2+, LGPLv2.1+, Public Domain

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_hook
$(BinDir)/xz --version | grep $(Version)
endef
