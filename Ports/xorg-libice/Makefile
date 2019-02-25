include ../../Library/GNU.mk

Title=		xorg-Libice
Name=		xorg-libice
Version=	1.0.9
Site=		https://gitlab.freedesktop.org/xorg
Source=		https://gitlab.freedesktop.org/xorg/lib/libice/-/archive/libICE-${Version}/libice-libICE-${Version}.tar.bz2
License=        GPL

UncompressedName= libice-libICE-${Version}

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
