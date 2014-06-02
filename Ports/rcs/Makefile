include ../../Library/GNU.mk

Title=		GNU RCS
Name=		rcs
Version=	5.9.2
Revision=	0
Site=		http://www.gnu.org/software/rcs/
URL=		http://ftp.gnu.org/gnu/rcs/
Source=		$(Name)-$(Version).tar.xz
License=	GPL

define test_inner_hook
$(BinDir)/rcs --version | grep $(Version)
endef
