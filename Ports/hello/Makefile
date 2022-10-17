include ../../Library/GNU.mk

Title=		GNU Hello
Name=		hello
Version=	2.12.1
Site=		https://www.gnu.org/software/hello/
Source=		https://ftp.gnu.org/gnu/hello/$(Name)-$(Version).tar.gz
License=	GPLv3

define test_hook
$(BinDir)/hello --version | grep $(Version)
endef
