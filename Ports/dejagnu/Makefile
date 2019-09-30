include ../../Library/GNU.mk

Title=		DejaGnu
Name=		dejagnu
Version=	1.6.2
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=        GPLv3

define test_iner_hook
$(BinDir)/runtest --version | grep $(Version)
endef
