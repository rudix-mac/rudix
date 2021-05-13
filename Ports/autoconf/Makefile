include ../../Library/GNU.mk

Title=		GNU Autoconf
Name=		autoconf
Version=	2.71
Site=		https://www.gnu.org/software/autoconf/
Source=		https://ftp.gnu.org/gnu/autoconf/$(Name)-$(Version).tar.gz
License=	GPLv3+

define test_hook
$(BinDir)/autoconf --version | grep $(Version)
endef
