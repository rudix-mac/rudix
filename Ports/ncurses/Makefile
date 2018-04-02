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

define install_post_hook
#rm -rf $(DestDir)$(DocDir)/gettext/csharpdoc
endef

define test_hook
#$(BinDir)/gettext --version | grep $(Version)
endef
