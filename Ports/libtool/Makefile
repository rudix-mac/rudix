include ../../Library/GNU.mk

Title=		GNU Libtool
Name=		libtool
Version=	2.4.2
Revision=	1
Site=		http://www.gnu.org/software/libtool/
URL=		http://ftp.gnu.org/gnu/libtool/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/libtool --version | grep $(Version)
endef
