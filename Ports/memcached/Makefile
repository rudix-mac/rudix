# $Id: Makefile,v 1.4 2009/07/24 00:55:36 ruda Exp $

include ../../Library/Rules.mk

# Distributed memory object caching system
# http://www.danga.com/memcached/
# BSD

TITLE=		memcached $(VERSION)
NAME=		memcached
VERSION=	1.4.0
REVISION=	0
URL=		http://www.danga.com/memcached/dist/
SOURCE=		$(NAME)-$(VERSION).tar.gz
DEPENDS=	/usr/local/lib/libevent.la

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--enable-threads ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO,doc/CONTRIBUTORS,doc/*.txt} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
