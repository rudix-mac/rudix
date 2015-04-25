include ../../Library/Unix.mk

Title=		WBox
Name=		wbox
Version=	5
Revision=	1
Site=		http://hping.org/wbox/
Source=		http://hping.org/wbox//$(Name)-$(Version).tar.gz
License=	BSD

define test_inner_hook
$(BinDir)/wbox -v | grep $(Version)
endef
