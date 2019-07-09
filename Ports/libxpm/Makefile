include ../../Library/GNU.mk
BuildRequires +=  /usr/local/share/pkgconfig/xorg-macros.pc
BuildRequires +=  /usr/local/share/pkgconfig/xproto.pc

Title=		Libxpm
Name=		libXpm
Version=	3.5.12
Site=		https://gitlab.freedesktop.org/xorg/lib/libxpm
Source=		https://gitlab.freedesktop.org/xorg/lib/libxpm/-/archive/libXpm-${Version}/libxpm-libXpm-${Version}.tar.bz2
License=        GPL

UncompressedName= libxpm-libXpm-3.5.12

define before_build_hook
cd $(BuildDir); ./autogen.sh
endef

define test_hook
$(BinDir)/libxpm --version | grep $(Version)
endef
