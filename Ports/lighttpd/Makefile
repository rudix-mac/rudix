# Secure, fast, compliant, and very flexible web-server
# http://www.lighttpd.net
# BSD

include ../../Library/Rules.mk

TITLE=		lighttpd $(VERSION)
NAME=		lighttpd
VERSION=	1.4.24
REVISION=	0
URL=		http://www.lighttpd.net/download
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/lib/libpcre.la
#DEPENDS+=	$(RECEIPTS)/lua.pkg

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
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
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,NEWS,README,doc/[a-z]*} $(INSTALLDOCDIR)
	rm -f $(INSTALLDOCDIR)/doc/*.1
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/sbin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lighttpd/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lighttpd/mod_*.so
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lighttpd/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lighttpd/mod_*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
