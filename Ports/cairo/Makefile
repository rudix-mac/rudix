# $Id: Makefile,v 1.3 2009/07/12 21:12:37 ruda Exp $
# Vector graphics library
# http://cairographics.org/
# LGPL

NAME=		cairo
VERSION=	1.8.8
REVISION=	0
URL=		http://www.cairographics.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libpixman-1.dylib

WITHOUT_X11=	1
WITHOUT_FT=	1
WITH_RUDIX_PNG= 1

ifdef WITHOUT_X11
X11=		--without-x --enable-xlib=no
else
DEPENDS+=	/usr/X11
X11=		--with-x --enable-xlib=yes
endif

ifdef WITHOUT_FT
FREETYPE=	--enable-ft=no
else
FREETYPE=	--enable-ft=yes
DEPENDS+=	/usr/X11/lib/libfreetype.dylib
endif

ifdef WITH_RUDIX_PNG
DEPENDS+=	/usr/local/bin/libpng-config
endif

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/X11R6/lib/pkgconfig" $(configure) \
		--disable-dependency-tracking \
		--with-html-dir=/usr/local/share/doc/cairo \
		$(X11) $(FREETYPE) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BIBLIOGRAPHY,BUGS,COPYING*,ChangeLog,HACKING,NEWS,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	#cd $(BUILDDIR) ; make check
	$(TOUCH) test
