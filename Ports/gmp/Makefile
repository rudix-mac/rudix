# Library for arbitrary precision arithmetic
# http://gmplib.org/
# LGPL

include ../../Library/Rules.mk

TITLE=		GNU MP $(VERSION)
NAME=		gmp
VERSION=	5.0.1
REVISION=	1
URL=		ftp://ftp.gmplib.org/pub/gmp-$(VERSION)/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env ABI=32 \
	$(configure) $(CONFIG_OPTS) \
		--enable-cxx ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
