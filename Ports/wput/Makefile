BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Wput
Name=		wput
Version=	0.6.1
Revision=	1
URL=		http://sourceforge.net/projects/wput/files/$(Name)/$(Version)
Source=		$(Name)-$(Version).tgz

ReadMeFile=	README

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define test_inner_hook
$(BinDir)/wput --version | grep $(Version)
endef
