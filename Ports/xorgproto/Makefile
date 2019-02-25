include ../../Library/GNU.mk

Title=		Xorgproto
Name=		xorgproto
Version=	2018.4
Site=		https://gitlab.freedesktop.org/xorg/
Source=		https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/archive/xorgproto-${Version}/xorgproto-xorgproto-${Version}.tar.bz2
License=        GPL

UncompressedName = xorgproto-xorgproto-${Version}

LicenseFile = ${BuildDir}/COPYING-x11proto

define before_build_hook
cd $(BuildDir); ./autogen.sh
endef
