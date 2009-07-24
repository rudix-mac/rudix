# $Id: Makefile,v 1.2 2009/03/21 18:44:02 ruda Exp $

# Ncurses BitTorrent client based on libTorrent
# http://libtorrent.rakshasa.no/
# GPL

NAME=		rtorrent
VERSION=	0.8.2
REVISION=	1
URL=		http://libtorrent.rakshasa.no/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk


DEPENDS=	/usr/local/lib/libtorrent.dylib
DEPENDS+=	/usr/local/lib/libsigc-2.0.dylib

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CXXFLAGS="$(CXXFLAGS)" PKG_CONFIG_PATH="$(PORTDIR)" \
	$(configure) --disable-dependency-tracking ; $(make) 
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
