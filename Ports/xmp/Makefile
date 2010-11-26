# Extended module player
# http://xmp.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		XMP $(VERSION)
NAME=		xmp
VERSION=	3.2.0
REVISION=	1
URL=		http://downloads.sourceforge.net/xmp
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/docs/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make) LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	cd $(BUILDDIR) ; \
	make DESTDIR=$(INSTALLDIR) BIN_DIR=$(INSTALLDIR)/usr/local/bin install
	rm -rf $(INSTALLDIR)/etc
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README $(BUILDDIR)/docs/{COPYING,CREDITS,ChangeLog} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
