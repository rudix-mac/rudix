# General-purpose utility library
# http://www.gtk.org/
# GPL

include ../../Library/Rules.mk

TITLE=		GLib $(VERSION)
NAME=		glib
VERSION=	2.27.92
REVISION=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.27
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS+=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libintl.la

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

ifdef STATIC_ONLY
CONFIG_OPTS+=	--enable-static --disable-shared
else
CONFIG_OPTS+=	--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	patch -d $(BUILDDIR)/glib < $(PORTDIR)/gconvert.c.patch
	patch -d $(BUILDDIR)/po < $(PORTDIR)/Makefile.in.in.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--disable-dependency-tracking \
		--with-html-dir=/usr/local/share/doc ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,HACKING,MAINTAINERS,NEWS,README} $(INSTALLDOCDIR)
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/tests ; ./testglib
	touch test
