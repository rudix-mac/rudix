# $Id: Makefile,v 1.2 2009/03/21 20:59:56 ruda Exp $

# Mpeg audio 1/2 layer 1, 2 and 3 player
# http://www.mpg123.de/

NAME=		mpg123
VERSION=	1.6.4
REVISION=	0
URL=		$(SOURCEFORGE)mpg123
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -rf $(BUILDDIR)/doc/examples/
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,doc/*} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/mpg123/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/mpg123/*.so"
	$(TOUCH) test
