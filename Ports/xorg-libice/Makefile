include ../../Library/GNU.mk

Title=		xorg-Libice
Name=		xorg-libice
Version=	1.0
Site=		https://rudix.org/
Source=		https://gitlab.freedesktop.org/xorg/lib/libice/-/archive/libICE-1.0.9/libice-libICE-1.0.9.tar.bz2
License=        GPL

UncompressedName= libice-libICE-1.0.9

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
