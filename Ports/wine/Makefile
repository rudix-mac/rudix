# Wine
# http://wiki.winehq.org/
# LGPL

include ../../Library/Rules.mk

TITLE=		Wine $(VERSION)
NAME=		wine
VERSION=	1.1.36
REVISION=	0
URL=		http://ibiblio.org/pub/linux/system/emulators/wine/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env FREETYPEINCL="-I/usr/X11/include/freetype2 -I/usr/X11/include" \
	    FREETYPELIBS="-L/usr/X11/lib -lfreetype" \
	$(configure) --disable-win16 ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ANNOUNCE,AUTHORS,COPYING.LIB,LICENSE,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
