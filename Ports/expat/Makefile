# $Id: Makefile,v 1.3 2009/07/22 01:37:08 ruda Exp $

include ../../Library/Rules.mk

# The Expat XML parser
# http://expat.sourceforge.net/

TITLE=		Expat $(VERSION)
NAME=		expat
VERSION=	2.0.1
REVISION=	5
URL=		$(SOURCEFORGE)expat
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,Changes,README,doc/*} $(INSTALLDOCDIR)
	rm $(INSTALLDIR)/usr/local/share/doc/expat/*.1
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(TOUCH) test
