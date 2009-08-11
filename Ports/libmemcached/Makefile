# http://tangent.org/552/libmemcached.html
# BSD

include ../../Library/Rules.mk

NAME=		libmemcached
VERSION=	0.31
REVISION=	0
URL=		http://download.tangent.org/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/include/memcached/protocol_binary.h

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure)  \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 ppc ; done
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
