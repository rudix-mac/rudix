include ../../Library/GNU.mk

Title=		SDL
Name=		sdl
Version=	1.2.15
Revision=	1
URL=		http://www.libsdl.org/release
Source=		SDL-$(Version).tar.gz

UncompressedName = sdl-$(Version) # Just in case

GnuConfigureExtra += --disable-video-x11

define test_inner_hook
$(BinDir)/sdl-config --version
endef
