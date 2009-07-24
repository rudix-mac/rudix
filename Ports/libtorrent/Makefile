# $Id: Makefile,v 1.2 2009/03/21 18:31:50 ruda Exp $

# BitTorrent library written in C++
# http://libtorrent.rakshasa.no/
# GPL

NAME=		libtorrent
VERSION=	0.12.2
REVISION=	1
URL=		http://libtorrent.rakshasa.no/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libsigc-2.0.dylib

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CXXFLAGS="$(CXXFLAGS)" \
		OPENSSL_CFLAGS=-I/usr/include \
		OPENSSL_LIBS=-lcrypto \
		PKG_CONFIG_PATH=/usr/lib/pkgconfig $(configure) \
			--disable-dependency-tracking \
			--with-openssl \
			--enable-static ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
