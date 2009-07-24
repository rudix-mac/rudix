# $Id: Makefile,v 1.2 2009/03/21 18:24:36 ruda Exp $

# Callback framework for C++
# http://libsigc.sourceforge.net/
# LGPL

NAME=		libsigc++
VERSION=	2.2.3
REVISION=	1
URL=		http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

DEPENDS=	/usr/local/bin/pkg-config

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
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	mv $(INSTALLDIR)/usr/local/share/doc/libsigc-2.0/docs/* $(INSTALLDOCDIR)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/libsigc-2.0
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
