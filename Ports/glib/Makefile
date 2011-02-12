# General-purpose utility library
# http://www.gtk.org/
# GPL

include ../../Library/Rules.mk

TITLE=		GLib $(VERSION)
NAME=		glib
VERSION=	2.27.93
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
# Build in two parts so we can join the parts later with lipo
	for a in i386 x86_64 ; do \
		mkdir -p $(BUILDDIR)/$$a ; \
		cd $(BUILDDIR)/$$a ; \
		env CFLAGS="-Os -arch $$a" LDFLAGS="-arch $$a" \
		../configure $(CONFIG_OPTS) \
			--with-html-dir=/usr/local/share/doc ; $(make) ; \
	done
# Join the parts
	for x in gdbus gio-querymodules glib-compile-schemas gsettings libgio-2.0.0.dylib libgio-2.0.a ; do \
		lipo -create \
			-arch i386 $(BUILDDIR)/i386/gio/.libs/$$x \
			-arch x86_64 $(BUILDDIR)/x86_64/gio/.libs/$$x \
			-output $(BUILDDIR)/i386/gio/.libs/$$x ; \
	done
	for x in gtester libglib-2.0.0.dylib libglib-2.0.a ; do \
		lipo -create \
			-arch i386 $(BUILDDIR)/i386/glib/.libs/$$x \
			-arch x86_64 $(BUILDDIR)/x86_64/glib/.libs/$$x \
			-output $(BUILDDIR)/i386/glib/.libs/$$x ; \
	done
	for x in libgmodule-2.0.0.dylib libgmodule-2.0.a ; do \
		lipo -create \
			-arch i386 $(BUILDDIR)/i386/gmodule/.libs/$$x \
			-arch x86_64 $(BUILDDIR)/x86_64/gmodule/.libs/$$x \
			-output $(BUILDDIR)/i386/gmodule/.libs/$$x ; \
	done
	for x in glib-genmarshal gobject-query libgobject-2.0.0.dylib libgobject-2.0.a ; do \
		lipo -create \
			-arch i386 $(BUILDDIR)/i386/gobject/.libs/$$x \
			-arch x86_64 $(BUILDDIR)/x86_64/gobject/.libs/$$x \
			-output $(BUILDDIR)/i386/gobject/.libs/$$x ; \
	done
	for x in libgthread-2.0.0.dylib libgthread-2.0.a ; do \
		lipo -create \
			-arch i386 $(BUILDDIR)/i386/gthread/.libs/$$x \
			-arch x86_64 $(BUILDDIR)/x86_64/gthread/.libs/$$x \
			-output $(BUILDDIR)/i386/gthread/.libs/$$x ; \
	done
	touch build
install: build
	cd $(BUILDDIR)/i386 ; make DESTDIR=$(INSTALLDIR) install
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
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/{gdbus,gio-querymodules,glib-compile-schemas,glib-genmarshal,gobject-query,gsettings,gtester}) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/i386/tests ; make test
	cd $(BUILDDIR)/x86_64/tests ; make test
	touch test
