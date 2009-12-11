# Ncurses BitTorrent client based on libTorrent
# http://libtorrent.rakshasa.no/
# GPL

include ../../Library/Rules.mk

TITLE=		rTorrent $(VERSION)
NAME=		rtorrent
VERSION=	0.8.6
REVISION=	0
URL=		http://libtorrent.rakshasa.no/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libtorrent.la
DEPENDS+=	/usr/local/lib/libsigc-2.0.la

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env \
		CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
		PKG_CONFIG_PATH="/usr/lib/pkgconfig" \
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
