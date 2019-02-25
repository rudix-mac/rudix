include ../../Library/GNU.mk

Title=		xorg-libSM
Name=		libSM
Version=	1.2.3
Site=		https://gitlab.freedesktop.org/xorg
Source=		https://gitlab.freedesktop.org/xorg/lib/libsm/-/archive/${Name}-${Version}/libsm-${Name}-${Version}.tar.bz2
License=    GPL

UncompressedName=libsm-${Name}-${Version}

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
