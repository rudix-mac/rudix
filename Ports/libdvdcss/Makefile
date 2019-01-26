include ../../Library/GNU.mk

Title=		Libdvdcss
Name=		libdvdcss
Version=	1.4.2
Site=		https://videolan.org
#Source=		https://download.videolan.org/pub/videolan/$(Name)/$(Version)/$(Name)-$(Version).tar.bz2
Source=	https://download.videolan.org/pub/videolan/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2
License=        GPL

define test_hook
$(BinDir)/libcssdvd --version | grep $(Version)
endef
