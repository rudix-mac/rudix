# SOund eXchange - universal sound sample translator
# http://sox.sourceforge.net/
# 

include ../../Library/Rules.mk

TITLE=		SoX $(VERSION)
NAME=		sox
VERSION=	14.3.2
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz
DEPENDS=	/usr/local/lib/libmp3lame.la

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--disable-gomp \
		--with-png=/usr/X11 ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
ifdef WITH_STATIC_LAME
	nm $(INSTALLDIR)/usr/local/lib/libsox.1.dylib | grep lame_init
endif
	cd $(BUILDDIR)/src ; sh tests.sh
	touch test
