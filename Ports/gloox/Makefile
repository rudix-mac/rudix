# $Id: Makefile,v 1.2 2009/07/22 02:01:27 ruda Exp $

include ../../Library/Rules.mk

# http://camaya.net/gloox
# GPL

TITLE=		Gloox $(VERSION)
NAME=		gloox
VERSION=	1.0-beta7
REVISION=	1
URL=		http://camaya.net/download/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CXXFLAGS="$(CXXFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,LICENSE,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
