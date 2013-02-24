include ../../Library/Unix.mk

Title=		WBox
Name=		wbox
Version=	5
Revision=	1
URL=		http://hping.org/wbox/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/wbox -v | grep $(Version)
endef
