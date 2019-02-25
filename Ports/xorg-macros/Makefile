include ../../Library/GNU.mk

Title=		Xorg-Macros
Name=		xorg-macros
Version=	1.19.2
Site=		https://gitlab.freedesktop.org/xorg
Source=		https://gitlab.freedesktop.org/xorg/util/macros/-/archive/util-macros-${Version}/macros-util-macros-${Version}.tar.bz2
License=        GPL

UncompressedName= macros-util-macros-${Version}

define before_build_hook
cd $(BuildDir); ./autogen.sh
endef
