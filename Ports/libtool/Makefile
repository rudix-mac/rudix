include ../../Library/GNU.mk

Title=		GNU Libtool
Name=		libtool
Version=	2.4.6
Revision=	1
Site=		https://www.gnu.org/software/libtool/
Source=		https://ftp.gnu.org/gnu/libtool/$(Name)-$(Version).tar.gz
License=	GPLv2

define test_inner_hook
$(BinDir)/libtool --version | grep $(Version)
endef
