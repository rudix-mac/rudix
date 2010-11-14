# Library for dynamic creation of images
# http://www.libgd.org/
# 

include ../../Library/Rules.mk

TITLE=		GD library $(VERSION)
NAME=		libgd
VERSION=	2.0.35
REVISION=	0
URL=		http://www.libgd.org/releases/
SOURCE=		gd-$(VERSION).tar.bz2

ifdef STATIC_ONLY
CONFIGURE_OPTS=		--enable-static --disable-shared
else
CONFIGURE_OPTS=		--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	mv gd-$(VERSION) $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking $(CONFIGURE_OPTS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,NEWS,README*} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
