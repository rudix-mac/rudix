# High-performance HTTP accelerator
# http://varnish.projects.linpro.no/

include ../../Library/Rules.mk

TITLE=		Varnish $(VERSION)
NAME=		varnish
VERSION=	2.1.4
REVISION=	0
URL=		http://www.varnish-software.com/sites/default/files
SOURCE=		$(NAME)-$(VERSION).tar.gz
DEPENDS=	/usr/local/lib/libpcre.la

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/etc/varnish ; \
		mv default.vcl default.vcl.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ChangeLog,LICENSE,README} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/sbin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
