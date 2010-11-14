# BitTorrent library written in C++
# http://libtorrent.rakshasa.no/
# GPL

include ../../Library/Rules.mk

NAME=		libtorrent
VERSION=	0.12.6
REVISION=	0
URL=		http://libtorrent.rakshasa.no/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libsigc-2.0.la

ifdef STATIC_ONLY
CONFIGURE_OPTS=		--enable-static --disable-shared
else
CONFIGURE_OPTS=		--enable-static --enable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
		OPENSSL_CFLAGS=-I/usr/include OPENSSL_LIBS=-lcrypto \
		PKG_CONFIG_PATH=/usr/lib/pkgconfig \
	$(configure) $(CONFIGURE_OPTS) \
			--disable-dependency-tracking \
			--with-openssl ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
