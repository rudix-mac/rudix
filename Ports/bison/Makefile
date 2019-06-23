include ../../Library/GNU.mk

Title=		GNU bison
Name=		bison
Version=	3.3.2
Site=		https://www.gnu.org/software/$(Name)
Source=		ftp://ftp.gnu.org/gnu/bison/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/bison --version | grep $(Version)
endef
