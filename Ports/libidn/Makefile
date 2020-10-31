include ../../Library/GNU.mk

Title=		GNU Libidn
Name=		libidn
Version=	1.36
Site=		https://www.gnu.org/software/libidn/
Source=		https://ftp.gnu.org/gnu/libidn/$(Name)-$(Version).tar.gz
License=	GPL+LGPL+GFDL

define test_hook
$(BinDir)/idn --version | grep $(Version)
endef
