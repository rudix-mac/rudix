include ../../Library/GNU.mk

Title=	 xorg-xtrans
Name=	 xorg-xtrans
Version= 1.3.5
Site=	 https://gitlab.freedesktop.org/xorg
Source=	 https://gitlab.freedesktop.org/xorg/lib/libxtrans/-/archive/xtrans-${Version}/libxtrans-xtrans-${Version}.tar.bz2
License= GPL

UncompressedName= libxtrans-xtrans-${Version}

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
