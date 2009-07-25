# $Id: Makefile,v 1.2 2009/03/21 18:52:28 ruda Exp $

include ../../Library/Rules.mk

# Secure, fast, compliant, and very flexible web-server
# http://www.lighttpd.net

NAME=		lighttpd
VERSION=	1.4.23
REVISION=	0
URL=		http://www.lighttpd.net/download
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/lib/libpcre.la
#DEPENDS+=	$(RECEIPTS)/lua.pkg

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--libdir=/usr/local/lib/lighttpd \
		--with-openssl ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/etc/lighttpd
	install -d $(INSTALLDIR)/usr/local/var/{www,log/lighttpd,run}
	install -m 644 $(PORTDIR)/lighttpd.conf.default $(INSTALLDIR)/usr/local/etc/lighttpd
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,doc/[a-z]*} $(INSTALLDOCDIR)
	rm -f $(INSTALLDOCDIR)/doc/*.1
	#strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/sbin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lighttpd/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lighttpd/mod_*.so
	$(TOUCH) install

test: install
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lighttpd/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lighttpd/mod_*.so"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
