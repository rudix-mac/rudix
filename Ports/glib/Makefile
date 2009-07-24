# $Id: Makefile,v 1.4 2009/07/22 01:41:07 ruda Exp $

include ../../Library/Rules.mk

# http://www.gtk.org/
# GPL

TITLE=		GLib
NAME=		glib
VERSION=	2.20.4
REVISION=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.20/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libintl.la

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) $(STATIC) \
		--disable-dependency-tracking \
		--enable-static \
		--with-html-dir=/usr/local/share/doc ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,HACKING,MAINTAINERS,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUILDDIR)/tests ; ./testglib
	$(TOUCH) test
