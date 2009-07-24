# $Id: Makefile,v 1.2 2009/03/04 01:21:02 ruda Exp $

# Extracts files from Microsoft CAB archives
# http://www.cabextract.org.uk/
# GPL

NAME=		cabextract
VERSION=	1.2
REVISION=	6
URL=		http://www.cabextract.org.uk/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -m 755 $(BUILDDIR)/src/cabinfo $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{magic,*.html} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
