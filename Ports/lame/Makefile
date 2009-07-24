# $Id: Makefile,v 1.2 2009/03/06 01:10:13 ruda Exp $

# Lame ain't an MP3 encoder
# http://lame.sourceforge.net/
# GPL

NAME=		lame
VERSION=	3.98.2
REVISION=	2intel
URL=		$(SOURCEFORGE)lame
SOURCE=		$(NAME)-398-2.tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	mv lame-398-2 $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS_INTEL)" $(configure) \
		--disable-dependency-tracking  ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{API,COPYING,LICENSE,README,STYLEGUIDE,TODO,USAGE} $(INSTALLDOCDIR)

	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
