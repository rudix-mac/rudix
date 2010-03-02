# SOund eXchange - universal sound sample translator
# http://sox.sourceforge.net/
# 

include ../../Library/Rules.mk

TITLE=		SoX $(VERSION)
NAME=		sox
VERSION=	14.3.0
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--disable-gomp \
		--with-png=/usr/X11 ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR)/src ; sh tests.sh
	$(TOUCH) test
