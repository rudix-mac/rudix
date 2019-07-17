#BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		Wput
Name=		wput
Version=	0.6.2
Site=		http://wput.sourceforge.net/
Source=		http://downloads.sourceforge.net/wput/$(Name)-$(Version).tgz
License=	GPL

ReadMeFile=	README

define test_hook
$(BinDir)/wput --version | grep $(Version)
endef
