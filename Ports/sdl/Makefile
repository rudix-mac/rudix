include ../../Library/GNU.mk

Title=		SDL
Name=		sdl
Version=	1.2.15
Site=		http://www.libsdl.org/
Source=		http://www.libsdl.org/release/SDL-$(Version).tar.gz
License=	LGPL

UncompressedName = sdl-$(Version) # Just in case

GnuConfigureExtra += --disable-video-x11

define test_inner_hook
$(BinDir)/sdl-config --version
endef
