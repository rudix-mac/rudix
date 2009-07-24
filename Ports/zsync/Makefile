# $Id: Makefile,v 1.2 2009/03/13 00:36:40 ruda Exp $

# Client-side implementation of the rsync algorithm
# http://zsync.moria.org.uk/
# GPL

NAME=		zsync
VERSION=	0.6
REVISION=	0
URL=		http://zsync.moria.org.uk/download/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR)/libzsync ; patch < $(PORTDIR)/sha1.c.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
