BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Hunspell
Name=		hunspell
Version=	1.3.3
Revision=	0
Site=           http://hunspell.sourceforge.net
URL=		http://downloads.sourceforge.net/hunspell
Source=		$(Name)-$(Version).tar.gz
License=        GPL

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_inner_hook
$(BinDir)/hunspell --version | grep $(Version)
endef
