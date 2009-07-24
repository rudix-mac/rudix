# $Id: Makefile,v 1.4 2009/07/18 04:08:47 ruda Exp $

# Library for arbitrary precision arithmetic
# http://gmplib.org/
# LGPL

NAME=		gmp
VERSION=	4.3.1
REVISION=	1
URL=		$(GNU)/gnu/gmp/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
ifdef STATIC_ONLY
	cd $(BUILDDIR) ; patch -p1 < $(PORTDIR)/gmp-4.2.1-static-IntelMac.patch
endif
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS_PPC)" LDFLAGS="$(LDFLAGS_PPC)" $(configure) $(STATIC) \
		--cache-file=$(PORTDIR)/config.cache.ppc  \
		--host=none-apple-darwin \
		--enable-cxx ; $(make)
	cd $(BUILDDIR) ; mv .libs .libs-ppc ; make clean
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS_INTEL)" LDFLAGS="$(LDFLAGS_INTEL)" $(configure) $(STATIC) \
		--cache-file=$(PORTDIR)/config.cache.i386 \
		--enable-cxx ; $(make)
ifndef STATIC_ONLY
	cd $(BUILDDIR)/.libs ; \
	for x in libgmp.3.5.0.dylib libgmpxx.4.1.0.dylib ; do \
		lipo -create \
			-arch i386 $$x \
			-arch ppc ../.libs-ppc/$$x \
			-o $$x ; done
endif
	cd $(BUILDDIR)/.libs ; for x in lib*.a ; do \
		lipo -create \
			-arch i386 $$x \
			-arch ppc ../.libs-ppc/$$x \
			-o $$x ; done
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
