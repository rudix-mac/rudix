# $Id: Makefile,v 1.2 2009/03/21 14:47:30 ruda Exp $

HOMEPAGE=	http://httpd.apache.org/

NAME=		httpd
VERSION=	2.2.11
REVISION=	1
URL=		http://www.apache.org/dist/httpd/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/config_layout.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--enable-layout=Rudix \
		--enable-ssl \
		--enable-modules=all \
		--enable-mods-shared=all \
		--enable-proxy ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; mv ../sbin/{ab,htdbm,htdigest,htpasswd,logresolve} .
	cd $(INSTALLDIR)/usr/local/etc/httpd ; \
	mv httpd.conf httpd.conf.default ; mv magic magic.default ; mv mime.types mime.types.default
	rm -f $(INSTALLDIR)/usr/local/var/www/html/index.html
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ABOUT_APACHE,CHANGES,LICENSE,NOTICE,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/sbin/*
	strip -x -S  $(INSTALLDIR)/usr/local/libexec/httpd/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/httpd/*.so"
	$(TOUCH) test
