# Library for arbitrary precision arithmetic
# http://gmplib.org/
# LGPL

include ../../Library/Rules.mk

TITLE=		GNU MP $(VERSION)
NAME=		gmp
VERSION=	4.3.2
REVISION=	0
URL=		http://ftp.gnu.org/gnu/gmp
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
ifdef STATIC_ONLY
	patch -d $(BUILDDIR)/tests < $(PORTDIR)/gmp-4.2.1-static-IntelMac.patch
endif
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) $(CONFIG_OPTS) --enable-cxx ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
