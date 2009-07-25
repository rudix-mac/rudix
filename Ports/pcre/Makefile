# $Id: Makefile,v 1.2 2009/03/16 02:30:40 ruda Exp $

include ../../Library/Rules.mk

# Perl-compatible regular expression library
# http://www.pcre.org/

TITLE=		PCRE $(VERSION)
NAME=		pcre
VERSION=	7.9
REVISION=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--enable-utf8 ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUILDDIR) ; ./RunTest
	$(TOUCH) test
