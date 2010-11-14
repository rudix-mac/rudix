# LZMA utils - make usage of LZMA compression easy
# http://tukaani.org/lzma/
# GPL

include ../../Library/Rules.mk

NAME=		lzma
VERSION=	4.32.7
REVISION=	2
URL=		http://tukaani.org/lzma/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING*,ChangeLog,NEWS,README,THANKS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
