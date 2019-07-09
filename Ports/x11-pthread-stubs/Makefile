include ../../Library/GNU.mk

Title=		pthread-stubs
Name=		x11-pthread-stubs
Version=	0.1
Site=		https://www.freedesktop.org
Source=		http://xcb.freedesktop.org/dist/libpthread-stubs-$(Version).tar.bz2
License=        GPL
UncompressedName=libpthread-stubs-$(Version)

define test_hook
$(BinDir)/x11-pthread-stubs --version | grep $(Version)
endef
