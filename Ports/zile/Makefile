BuildRequires += $(LibDir)/libgc.la # static-gc

include ../../Library/GNU.mk

Title=		GNU Zile
Name=		zile
Version=	2.4.9
Revision=	1
Site=		http://www.gnu.org/software/zile/
URL=		http://ftp.gnu.org/gnu/zile/
Source=		$(Name)-$(Version).tar.gz
License=	GPL


define test_inner_hook
$(BinDir)/zile --version | grep $(Version)
endef
