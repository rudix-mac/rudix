# High-quality MPEG audio decoder
# http://www.underbit.com/products/mad/
# GPL

include ../../Library/Rules.mk

TITLE=		MAD $(VERSION)
NAME=		libmad
VERSION=	0.15.1b
REVISION=	14
URL=		ftp://ftp.mars.org/pub/mpeg/
SOURCE=		libmad-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/libmad-0.15.1b-configure.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
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
