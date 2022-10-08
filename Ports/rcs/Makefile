include ../../Library/GNU.mk

PrepRequires = $(BinDir)/lunzip	# lunzip

Title=		GNU RCS
Name=		rcs
Version=	5.10.1
Site=		https://www.gnu.org/software/rcs/
Source=		https://ftp.gnu.org/gnu/rcs/$(Name)-$(Version).tar.lz
License=	GPLv3+

define test_hook
$(BinDir)/rcs --version | grep $(Version)
$(BinDir)/rcs clean
endef
