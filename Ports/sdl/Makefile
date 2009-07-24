# $Id: Makefile,v 1.2 2009/03/21 01:51:04 ruda Exp $

# Cross-platform multimedia library
# http://www.libsdl.org/

NAME=		SDL
VERSION=	1.2.13
REVISION=	3
URL=		http://www.libsdl.org/release/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_PPC)" LDFLAGS="$(LDFLAGS_PPC)" $(configure) --disable-assembly --cache-file=$(PORTDIR)/config.cache.ppc ; $(make)
	mv $(BUILDDIR)/build $(BUILDDIR)/build-ppc
	cd $(BUILDDIR) ; make clean
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_INTEL)" LDFLAGS="$(LDFLAGS_INTEL)" $(configure) --cache-file=$(PORTDIR)/config.cache.i386 --enable-nasm ; $(make)
	lipo -create \
		-arch i386 $(BUILDDIR)/build/libSDLmain.a \
		-arch ppc $(BUILDDIR)/build-ppc/libSDLmain.a \
		-output $(BUILDDIR)/build/libSDLmain.a
	lipo -create \
		-arch i386 $(BUILDDIR)/build/.libs/libSDL.a \
		-arch ppc $(BUILDDIR)/build-ppc/.libs/libSDL.a \
		-output $(BUILDDIR)/build/.libs/libSDL.a
	lipo -create \
		-arch i386 $(BUILDDIR)/build/.libs/libSDL-1.2.0.11.2.dylib \
		-arch ppc $(BUILDDIR)/build-ppc/.libs/libSDL-1.2.0.11.2.dylib \
		-output $(BUILDDIR)/build/.libs/libSDL-1.2.0.11.2.dylib
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,COPYING,CREDITS,README,README-SDL.txt,README.MacOSX} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
