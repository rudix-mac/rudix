# $Id: Makefile,v 1.2 2009/03/21 18:01:32 ruda Exp $

# Portable audio output library
# http://xiph.org/ao/
# GPL

NAME=		libao
VERSION=	0.8.8
REVISION=	5
URL=		http://downloads.xiph.org/releases/ao/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/bin/pkg-config

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--enable-static ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make	DESTDIR=$(INSTALLDIR) \
		docdir=$(NSTALLDOCDIR)/usr/local/share/doc/libao install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,README,TODO} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	strip -x -S $(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.so
	strip -x -S $(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.so"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.a"
	$(TOUCH) test
