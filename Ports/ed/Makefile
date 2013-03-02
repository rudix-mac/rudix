include ../../Library/GNU.mk

Title=		GNU ed
Name=		ed
Version=	1.7
Revision=	0
URL=		http://ftp.gnu.org/gnu/ed/
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/ed --version | grep $(Version)
endef
