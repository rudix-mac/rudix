include ../../Library/GNU.mk

Title=		libXau
Name=		x11-libxau
Version=	1.0.9
Site=		https://www.x.org
Source=		https://www.x.org/pub/individual/lib/libXau-$(Version).tar.bz2
License=        GPL
UncompressedName=libXau-1.0.9
define test_hook
$(BinDir)/x11-libxau --version | grep $(Version)
endef
