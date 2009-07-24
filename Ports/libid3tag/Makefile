# $Id: Makefile,v 1.2 2009/03/21 18:07:04 ruda Exp $

# Library for reading ID3 tags
# http://www.underbit.com/products/mad/

NAME=		libid3tag
VERSION=	0.15.1b
REVISION=	14
URL=		$(SOURCEFORGE)mad
SOURCE=		libid3tag-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/libid3tag-0.15.1b-configure.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make) 
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,COPYRIGHT,CREDITS,README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(TOUCH) test
