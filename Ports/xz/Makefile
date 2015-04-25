BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		XZ Utils
Name=		xz
Version=	5.0.7
Revision=	0
Site=		http://tukaani.org/xz/
Source=		http://tukaani.org/xz//$(Name)-$(Version).tar.bz2
License=	GPL

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_inner_hook
$(BinDir)/xz --version | grep $(Version)
endef
