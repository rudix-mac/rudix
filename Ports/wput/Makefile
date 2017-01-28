#BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Wput
Name=		wput
Version=	0.6.2
Site=		http://wput.sourceforge.net/
Source=		http://downloads.sourceforge.net/wput/$(Name)-$(Version).tgz
License=	GPL

ReadMeFile=	README

#ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
#LdFlags += -framework CoreFoundation
#endif

define test_inner_hook
$(BinDir)/wput --version | grep $(Version)
endef
