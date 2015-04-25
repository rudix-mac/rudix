include ../../Library/GNU.mk

Title=		GNU Hello
Name=		hello
Version=	2.9
Revision=	0
Site=		http://www.gnu.org/software/hello/
Source=		http://ftp.gnu.org/gnu/hello//$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/hello --version | grep $(Version)
endef
