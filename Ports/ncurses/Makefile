include ../../Library/GNU.mk

Title=		GNU ncurses
Name=		ncurses
Version=	6.1
Site=		http://www.invisible-island.net/ncurses
Source=		ftp://ftp.invisible-island.net/ncurses/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --enable-widec
GnuConfigureExtra += --without-tack
GnuConfigureExtra += --without-tests

define test_hook
$(BinDir)/ncursesw6-config --version | grep $(Version)
endef
