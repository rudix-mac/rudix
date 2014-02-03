include ../../Library/GNU.mk

Title=		NCurses Disk Usage
Name=		ncdu
Version=	1.10
Revision=	0
URL=		http://dev.yorhel.nl/download/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/ncdu -v | grep $(Version)
endef
