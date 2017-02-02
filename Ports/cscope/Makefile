include ../../Library/GNU.mk

Title=		Cscope
Name=		cscope
Version=	15.8b
Site=		http://cscope.sourceforge.net/
Source=		http://sourceforge.net/projects/cscope/files/cscope/$(Version)/$(Name)-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/cscope -V 2>&1 | grep $(Version)
endef
