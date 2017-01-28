include ../../Library/GNU.mk

Title=		DejaGnu
Name=		dejagnu
Version=	1.5.3
Site=		https://gnu.org/software/dejagnu/
Source=		https://ftp.gnu.org/pub/gnu/dejagnu/dejagnu-$(Version).tar.gz
License=        GPLv3

define test_iner_hook
$(BinDir)/runtest --version | grep $(Version)
endef
