include ../../Library/GNU.mk

Title=		SDL
Name=		sdl
Version=	1.2.15
Revision=	0
URL=		http://www.libsdl.org/release
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = sdl-$(Version) # Just in case…

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/sdl-config --version
endef
