include ../../Library/GNU.mk

Title=		Libao
Name=		libao
Version=	1.2.0
Revision=	0
Site=		http://xiph.org/ao/
URL=		http://downloads.xiph.org/releases/ao/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
test -f $(LibDir)/libao.la
test -f $(LibDir)/pkgconfig/ao.pc
endef
