# $Id: Makefile,v 1.2 2009/03/21 20:13:17 ruda Exp $

HOMEPAGE=	http://www.gnu.org/software/make/

NAME=		make
VERSION=	3.81
REVISION=	2
URL=		$(GNU)/gnu/make/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--program-prefix="gnu" ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf gnumake make
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf gnumake.1 make.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	#cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
