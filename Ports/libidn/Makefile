include ../../Library/GNU.mk

Title=		GNU IDN Library
Name=		libidn
Version=	1.28
Revision=	1
Site=		http://www.gnu.org/software/libidn/
URL=		http://ftp.gnu.org/gnu/libidn/
Source=		$(Name)-$(Version).tar.gz
License=	GPL+LGPL

define test_inner_hook
$(BinDir)/idn --version | grep $(Version)
endef
