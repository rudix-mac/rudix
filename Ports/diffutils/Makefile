include ../../Library/GNU.mk

Title=		GNU Diffutils
Name=		diffutils
Version=	3.7
Site=		https://www.gnu.org/software/diffutils/
Source=		https://ftp.gnu.org/gnu/diffutils/$(Name)-$(Version).tar.xz
License=        GPLv3

define test_hook
$(BinDir)/diff --version | grep $(Version)
endef
