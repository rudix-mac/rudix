include ../../Library/GNU.mk

Title=		GNU Libidn
Name=		libidn
Version=	1.26
Revision=	0
URL=		http://ftp.gnu.org/gnu/libidn/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/idn --version | grep $(Version)
endef
