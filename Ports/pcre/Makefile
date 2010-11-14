# Perl-compatible regular expression library
# http://www.pcre.org/

include ../../Library/Rules.mk

TITLE=		PCRE $(VERSION)
NAME=		pcre
VERSION=	8.00
REVISION=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef STATIC_ONLY
CONFIGURE_OPTS= --enable-static --disable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) \
		--disable-dependency-tracking \
		--enable-utf8 ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; ./RunTest
	touch test
