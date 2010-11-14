# Extended module player
# http://xmp.sourceforge.net/
# GPL

TITLE=		XMP $(VERSION)
NAME=		xmp
VERSION=	3.0.0
REVISION=	0
URL=		http://downloads.sourceforge.net/xmp
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	#patch -d $(BUILDDIR)/src/drivers < $(PORTDIR)/osx.c.patch
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
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
