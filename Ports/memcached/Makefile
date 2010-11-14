# Distributed memory object caching system
# http://memcached.org/
# BSD

include ../../Library/Rules.mk

TITLE=		memcached $(VERSION)
NAME=		memcached
VERSION=	1.4.5
REVISION=	0
URL=		http://memcached.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libevent.la

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking --enable-threads ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,doc/CONTRIBUTORS,doc/*.txt} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/memcached -verify_arch i386 x86_64
	cd $(BUILDDIR) ; make test
	touch test
