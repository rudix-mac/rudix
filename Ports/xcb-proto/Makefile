include ../../Library/GNU.mk

Title=		xcb-proto
Name=		xcb-proto
Version=	1.13
Site=		https://xorg.freedesktop.org
Source=		https://xorg.freedesktop.org/archive/individual/xcb/$(Name)-$(Version).tar.bz2
License=        GPL

define test_hook
$(BinDir)/xcb-proto --version | grep $(Version)
endef
