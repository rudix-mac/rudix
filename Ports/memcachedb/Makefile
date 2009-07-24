# $Id: Makefile,v 1.2 2009/03/14 00:18:42 ruda Exp $

# Distributed key-value storage system

HOMEPAGE=	http://memcachedb.org/

NAME=		memcachedb
VERSION=	1.2.0
REVISION=	0
URL=		http://memcachedb.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libevent.dylib
DEPENDS+=	/usr/local/lib/libdb.dylib

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking  \
		--with-bdb=/usr/local ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CREDITS,ChangeLog,LICENSE,README,TODO,doc/*.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/tools/*.py $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
