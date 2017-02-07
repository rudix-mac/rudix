BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		GNU gcal
Name=		gcal
Version=	4.1
Site=		http://www.gnu.org/software/gcal/
Source=		http://ftp.gnu.org/gnu/gcal//$(Name)-$(Version).tar.xz
License=	GPL

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_hook
$(BinDir)/gcal --version | grep $(Version)
endef
