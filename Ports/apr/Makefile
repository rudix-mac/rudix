# $Id: Makefile,v 1.2 2009/07/22 00:18:40 ruda Exp $

include ../../Library/Rules.mk

# http://apr.apache.org/
# Apache License

TITLE=		Apache Portable Runtime $(VERSION)
NAME=		apr
VERSION=	1.3.6
REVISION=	0
URL=		http://www.apache.org/dist/apr/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--prefix=/usr/local \
		--with-installbuilddir=/usr/local/share/apr-1/build-1 \
		--enable-threads ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,NOTICE,README.dev} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/* $(INSTALLDOCDIR)
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	cd $(BUILDDIR)/test ; make all ; ./testall -v
	$(TOUCH) test
