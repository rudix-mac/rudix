include ../../Library/GNU.mk

Title=		Cscope
Name=		cscope
Version=	15.9
Site=		http://cscope.sourceforge.net/
Source=		https://sourceforge.net/projects/cscope/files/cscope/v$(Version)/cscope-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/cscope -V 2>&1 | grep $(Version)
endef
