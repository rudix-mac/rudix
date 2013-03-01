include ../../Library/GNU.mk

Title=		GNU Hello
Name=		hello
Version=	2.8
Revision=	0
URL=		http://ftp.gnu.org/gnu/hello/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/hello --version | grep $(Version)
endef
