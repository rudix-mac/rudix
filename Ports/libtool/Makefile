include ../../Library/GNU.mk

Title=		GNU Libtool
Name=		libtool
Version=	2.4.2
Revision=	1
URL=		http://ftp.gnu.org/gnu/libtool/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/libtool --version | grep $(Version)
endef
