BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=          GNU Aspell
Name=           aspell
Version=        0.60.6.1
Site=		http://aspell.net/
Source=		http://ftp.gnu.org/gnu/aspell//$(Name)-$(Version).tar.gz
License=	LGPL

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation
endif

define test_hook
$(BinDir)/aspell --version | grep $(Version)
endef
