include ../../Library/GNU.mk

Title=		Libmicrohttpd
Name=		libmicrohttpd
Version=	0.9.68
Site=		${GnuHome}/${Name}
Source=		${GnuMirror}/${Name}/$(Name)-$(Version).tar.gz
License=        GPL

PatchLevel=-p1
define test_hook
$(BinDir)/libmicrohttpd --version | grep $(Version)
endef
