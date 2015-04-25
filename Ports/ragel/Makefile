include ../../Library/GNU.mk

Title=		Ragel State Machine Compiler
Name=		ragel
Version=	6.9
Revision=	0
Site=		http://www.colm.net/open-source/ragel/
Source=		http://www.colm.net/wp-content/uploads/2014/10/$(Name)-$(Version).tar.gz
License=	GPL

define check_inner_hook
cd $(BuildDir)/test ; ./runtests
endef

define test_inner_hook
$(BinDir)/ragel --version | grep $(Version)
endef
