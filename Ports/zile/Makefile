BuildRequires += $(LibDir)/libgc.la # static-gc

include ../../Library/GNU.mk

Title=		GNU Zile
Name=		zile
Version=	2.4.9
Revision=	1
URL=		http://ftp.gnu.org/gnu/zile/
Source=		$(Name)-$(Version).tar.gz


define test_inner_hook
$(BinDir)/zile --version | grep $(Version)
endef
