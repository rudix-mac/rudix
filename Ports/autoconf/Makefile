include ../../Library/GNU.mk

Title=		GNU Autoconf
Name=		autoconf
Version=	2.69
Revision=	2
Site=		http://www.gnu.org/software/autoconf/
URL=		http://ftp.gnu.org/gnu/autoconf/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/autoconf --version | grep $(Version)
endef
