# Library for reading ID3 tags
# http://www.underbit.com/products/mad/
#

include ../../Library/Rules.mk

TITLE=		ID3v2 $(VERSION)
NAME=		libid3tag
VERSION=	0.15.1b
REVISION=	15
URL=		ftp://ftp.mars.org/pub/mpeg/
SOURCE=		libid3tag-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/libid3tag-0.15.1b-configure.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make) 
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,COPYRIGHT,CREDITS,README,TODO} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(TOUCH) test
