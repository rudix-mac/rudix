include ../../Library/GNU.mk

Title=		GNU bison
Name=		bison
Version=	3.4.2
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/bison --version | grep $(Version)
endef
