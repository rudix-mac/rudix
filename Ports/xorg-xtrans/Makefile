include ../../Library/GNU.mk

Title=		xorg-xtrans
Name=		xorg-xtrans
Version=	1.0
Site=		https://rudix.org/
Source=		https://gitlab.freedesktop.org/xorg/lib/libxtrans/-/archive/xtrans-1.3.5/libxtrans-xtrans-1.3.5.tar.bz2
License=        GPL

UncompressedName= libxtrans-xtrans-1.3.5

define before_build_hook
cd $(BuildDir) && ./autogen.sh
endef
