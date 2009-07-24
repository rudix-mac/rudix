# $Id: Makefile,v 1.2 2009/03/17 01:00:22 ruda Exp $

# Extended module player
# http://xmp.sourceforge.net/
# GPL

NAME=		xmp
VERSION=	2.5.1
REVISION=	3
URL=		$(SOURCEFORGE)xmp
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS_PPC)" $(configure) \
		--cache-file=$(PORTDIR)/config.cache.ppc ; \
	make LDFLAGS="$(LDFLAGS_PPC)"
	cd $(BUILDDIR) ; mv src/main/a.out src/main/xmp-ppc ; make clean
	cd $(BUILDDIR) ; env FLAGS="$(CFLAGS_INTEL)" $(configure) \
		--cache-file=$(PORTDIR)/config.cache.i386 ; \
	make
	cd $(BUILDDIR)/src/main ; \
	lipo -create -arch i386 xmp -arch ppc xmp-ppc -o xmp
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make DESTDIR=$(INSTALLDIR) BIN_DIR=$(INSTALLDIR)/usr/local/bin install
	rm -rf $(INSTALLDIR)/etc
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README $(BUILDDIR)/docs/{COPYING,CREDITS,ChangeLog} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
