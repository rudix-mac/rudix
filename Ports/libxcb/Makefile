include ../../Library/GNU.mk

Title=		libxcb
Name=		libxcb
Version=	1.13
Site=		https://xorg.freedesktop.org
Source=		https://xorg.freedesktop.org/archive/individual/xcb/$(Name)-$(Version).tar.bz2
License=        GPL

define test_hook
$(BinDir)/libxcb --version | grep $(Version)
endef
