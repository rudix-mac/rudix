include ../../Library/GNU.mk

Title=		Libao
Name=		libao
Version=	1.2.0
Site=		http://xiph.org/ao/
Source=		http://downloads.xiph.org/releases/ao//$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
test -f $(LibDir)/libao.la
test -f $(LibDir)/pkgconfig/ao.pc
endef
