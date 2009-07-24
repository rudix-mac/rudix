# $Id: Makefile,v 1.2 2009/03/27 01:34:40 ruda Exp $

# Embedded SQL implementation
# http://www.sqlite.org/

NAME=		sqlite
VERSION=	3.6.11
REVISION=	0
URL=		http://www.sqlite.org/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env MACOSX_DEPLOYMENT_TARGET=10.3 \
		CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	cd $(BUILDDIR) ; \
	install -m 644 sqlite3.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{README,VERSION} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	strip -x -S $(INSTALLDIR)/System/Library/Frameworks/Tcl.framework/Versions/8.4/Resources/Scripts/sqlite3/*.dylib
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(test-universal-binary) "$(INSTALLDIR)/System/Library/Frameworks/Tcl.framework/Versions/8.4/Resources/Scripts/sqlite3/*.dylib"
	$(TOUCH) test
