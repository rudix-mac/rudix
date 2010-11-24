# Tiny program emulating the detach feature of screen
# http://dtach.sourceforge.net
# GPL

include ../../Library/Rules.mk

TITLE=		dtach $(VERSION)
NAME=		dtach
VERSION=	0.8
REVISION=	5
URL=		http://downloads.sourceforge.net/dtach
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
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/dtach $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/dtach.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
