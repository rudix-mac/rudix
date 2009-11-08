# Perl-compatible regular expression library
# http://www.pcre.org/

include ../../Library/Rules.mk

TITLE=		PCRE $(VERSION)
NAME=		pcre
VERSION=	8.00
REVISION=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--enable-utf8 ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; ./RunTest
	$(TOUCH) test
