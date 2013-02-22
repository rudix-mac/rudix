include ../../Library/GNU.mk

Title=		Libao
Name=		libao
Version=	1.1.0
Revision=	2
URL=		http://downloads.xiph.org/releases/ao/
Source=		$(Name)-$(Version).tar.gz


ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
else
GnuConfigureExtra += --enable-static --enable-shared
endif
