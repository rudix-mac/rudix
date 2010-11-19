# Extracts files from Microsoft CAB archives
# http://www.cabextract.org.uk/
# GPL

include ../../Library/Rules.mk

TITLE=		cabextract $(VERSION)
NAME=		cabextract
VERSION=	1.3
REVISION=	1
URL=		http://www.cabextract.org.uk/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -m 755 $(BUILDDIR)/src/cabinfo $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{magic,*.html} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
