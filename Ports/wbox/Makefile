include ../../Library/Unix.mk

Title=		WBox
Name=		wbox
Version=	5
Site=		http://hping.org/wbox/
Source=		http://hping.org/wbox//$(Name)-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/wbox -v | grep $(Version)
endef
