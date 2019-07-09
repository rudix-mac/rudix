include ../../Library/GNU.mk

Title=		Xorg-Libxext
Name=		xorg-libxext
Version=	1.3.3
Site=		https://gitlab.freedesktop.org/xorg
Source=		https://gitlab.freedesktop.org/xorg/lib/libxext/-/archive/libXext-${Version}/libxext-libXext-${Version}.tar.bz2
License=        GPL

UncompressedName= libxext-libXext-${Version}

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
