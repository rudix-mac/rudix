# SSL encryption wrapper for standard network daemons
# http://www.stunnel.org/
# GPL

include ../../Library/Rules.mk

NAME=		stunnel
VERSION=	4.33
REVISION=	0
URL=		http://www.stunnel.org/download/stunnel/src/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/src/stunnel $(INSTALLDIR)/usr/local/sbin
	install -d $(INSTALLDIR)/usr/local/share/man/man8
	install -m 644 $(BUILDDIR)//doc/stunnel.8 $(INSTALLDIR)/usr/local/share/man/man8
	install -d $(INSTALLDIR)/usr/local/etc/stunnel
	install -m 644 $(BUILDDIR)/tools/stunnel.conf-sample $(INSTALLDIR)/usr/local/etc/stunnel/stunnel.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/sbin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
