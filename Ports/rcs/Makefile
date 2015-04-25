include ../../Library/GNU.mk

Title=		GNU RCS
Name=		rcs
Version=	5.9.3
Revision=	0
Site=		http://www.gnu.org/software/rcs/
Source=		http://ftp.gnu.org/gnu/rcs//$(Name)-$(Version).tar.xz
License=	GPL

define test_inner_hook
$(BinDir)/rcs --version | grep $(Version)
endef
