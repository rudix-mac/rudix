include ../../Library/GNU.mk

Title=		GNU RCS
Name=		rcs
Version=	5.9.4
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.xz
License=	GPLv3

define test_hook
$(BinDir)/rcs --version | grep $(Version)
endef
