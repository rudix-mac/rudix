include ../../Library/GNU.mk

Title=		GNU ed
Name=		ed
Version=	1.10
Revision=	0
Site=		http://www.gnu.org/software/ed/
URL=		http://ftp.gnu.org/gnu/ed/
Source=		$(Name)-$(Version).tar.lz
License=	GPL

define test_inner_hook
$(BinDir)/ed --version | grep $(Version)
endef
