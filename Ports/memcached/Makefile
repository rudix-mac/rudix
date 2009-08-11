# Distributed memory object caching system
# http://www.danga.com/memcached/
# BSD

include ../../Library/Rules.mk

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
	lipo $(INSTALLDIR)/usr/local/bin/memcached -verify_arch i386 ppc7400
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
