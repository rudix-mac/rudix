include ../../Library/GNU.mk

Title=		libX11
Name=		xorg-libx11
Version=	1.6.8
Site=		https://www.x.org
Source=		https://www.x.org/archive/individual/lib/libX11-$(Version).tar.bz2
License=        GPL
UncompressedName=libx11-${Version}
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/xorg-libx11 --version | grep $(Version)
endef
