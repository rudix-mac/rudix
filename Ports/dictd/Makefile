# Dictionary Server Protocol client and server
# http://sourceforge.net/projects/dict/
# GPL

include ../../Library/Rules.mk

NAME=		dictd
VERSION=	1.11.2
REVISION=	0
URL=		http://downloads.sourceforge.net/dict
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep
	cd $(BUILDDIR) ; \
	env LIBTOOL=glibtool CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/etc
	install -m 644 dict.conf.default $(INSTALLDIR)/usr/local/etc/
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ANNOUNCE,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{rfc2229.txt,security.doc} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/sbin/*
	touch install

test: install
	cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	touch test
