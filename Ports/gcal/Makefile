BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU gcal
Name=		gcal
Version=	3.6.2
Revision=	0
Site=		http://www.gnu.org/software/gcal/
URL=		http://ftp.gnu.org/gnu/gcal/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_inner_hook
$(BinDir)/gcal --version
endef
