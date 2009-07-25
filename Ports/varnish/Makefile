# $Id: Makefile,v 1.2 2009/03/22 20:51:42 ruda Exp $

include ../../Library/Rules.mk

# High-performance HTTP accelerator
# http://varnish.projects.linpro.no/

TITLE=		Varnish $(VERSION)
NAME=		varnish
VERSION=	2.0.4
REVISION=	0
URL=		$(SOURCEFORGE)varnish
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch -p0 < $(PORTDIR)/daemonize.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/etc/varnish ; \
		mv default.vcl default.vcl.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ChangeLog,LICENSE,README} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/sbin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUIDDIR) ; make check
	$(TOUCH) test
