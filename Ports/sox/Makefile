# $Id: Makefile,v 1.2 2009/03/22 20:15:41 ruda Exp $

# SOund eXchange - universal sound sample translator

HOMEPAGE=	http://sox.sourceforge.net/

NAME=		sox
VERSION=	14.2.0
REVISION=	1
URL=		$(SOURCEFORGE)sox
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

#DEPENDS=	$(RECEIPTS)/libmad.pkg
#DEPENDS+=	$(RECEIPTS)/lame.pkg

ifdef WITHOUT_PNG
PNG=		--with-png=no
else
PNG=		--with-png=yes
DEPENDS+=	/usr/local/lib/libpng.dylib
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking $(PNG) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	strip -x -S $(INSTALLDIR)/usr/local/lib/sox/lib*.so
	strip -x -S $(INSTALLDIR)/usr/local/lib/sox/lib*.a
	$(TOUCH) install

test: install
	#cd $(BUILDDIR)/src ; sh tests.sh
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/sox/lib*.so"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/sox/lib*.a"
	$(TOUCH) test

