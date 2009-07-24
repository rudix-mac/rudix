# $Id: Makefile,v 1.5 2009/07/22 01:39:51 ruda Exp $

include ../../Library/Rules.mk

# http://www.gnu.org/software/gettext/
# GPL

TITLE=		GNU gettext $(VERSION)
NAME=		gettext
VERSION=	0.17
REVISION=	5
URL=		$(GNU)/gnu/gettext/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR)/gettext-runtime/gnulib-lib ; \
		patch < $(PORTDIR)/runtime-setenv.c.patch
	cd $(BUILDDIR)/gettext-tools/gnulib-lib ; \
		patch < $(PORTDIR)/tools-environ.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(STATIC) \
		--enable-threads \
		--disable-csharp ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS} $(INSTALLDOCDIR)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/gettext/examples
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
