# $Id: Makefile,v 1.2 2009/03/21 19:41:50 ruda Exp $

# High-quality MPEG audio decoder
# http://www.underbit.com/products/mad/
# GPL

NAME=		libmad
VERSION=	0.15.1b
REVISION=	13
URL=		$(SOURCEFORGE)mad
SOURCE=		libmad-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/libmad-0.15.1b-configure.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_PPC)" LDFLAGS="$(LDFLAGS_PPC)" $(configure) --cache-file=$(PORTDIR)/config.cache.ppc --enable-fpm=ppc ; \
	$(make)
	cd $(BUILDDIR) ; mv .libs .libs-ppc
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_INTEL)" LDFLAGS="$(LDFLAGS_INTEL)" $(configure) --cache-file=$(PORTDIR)/config.cache.i386 --enable-fpm=intel ; \
	$(make)
	cd $(BUILDDIR) ; \
	lipo -create -arch i386 .libs/libmad.0.2.1.dylib -arch ppc .libs-ppc/libmad.0.2.1.dylib -o .libs/libmad.0.2.1.dylib ; \
	lipo -create -arch i386 .libs/libmad.a -arch ppc .libs-ppc/libmad.a -o .libs/libmad.a
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,COPYRIGHT,CREDITS,README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(TOUCH) test
