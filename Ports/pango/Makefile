# Library for layout and rendering of text
# http://www.pango.org/
# LGPL

include ../../Library/Rules.mk

TITLE=		Pango $(VERSION)
NAME=		pango
VERSION=	1.27.1
REVISION=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/pango/1.27
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/lib/libglib-2.0.la
DEPENDS+=	/usr/local/lib/libpixman-1.la
DEPENDS+=	/usr/local/lib/libcairo.la

ifdef STATIC_ONLY
CONFIGURE_OPTS=	--enable-static --disable-shared
else
CONFIGURE_OPTS=	--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking $(CONFIGURE_OPTS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/pango/pangox.aliases \
		$(INSTALLDIR)/usr/local/etc/pango/pangox.aliases.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/pango/*/modules/*.so
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/pango/*/modules/*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/pango/*/modules/*.so) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 ppc ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/pango/*/modules/*.a) ; do \
		lipo $$x -verify_arch i386 ppc ; done
	cd $(BUILDDIR) ; make check
	touch test
