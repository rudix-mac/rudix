include ../../Library/GNU.mk

Title=		NCurses Disk Usage
Name=		ncdu
Version=	1.10
Site=		http://dev.yorhel.nl/ncdu
Source=		http://dev.yorhel.nl/download//$(Name)-$(Version).tar.gz
License=	MIT

define test_inner_hook
$(BinDir)/ncdu -v | grep $(Version)
endef
