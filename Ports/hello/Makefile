include ../../Library/GNU.mk

Title=		GNU Hello
Name=		hello
Version=	2.10
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/hello/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/hello --version | grep $(Version)
endef
