# $Id: Makefile,v 1.2 2009/03/05 20:00:40 ruda Exp $

# Full-featured text WWW browser
# http://elinks.cz/
# GPL

NAME=		elinks
VERSION=	0.11.5
REVISION=	1
URL=		http://elinks.or.cz/download/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_PPC)" $(configure) \
		--cache-file=$(PORTDIR)/config.cache.ppc \
		--without-x ; $(make)
	cd $(BUILDDIR) ; mv src/elinks src/elinks-ppc ; make clean
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_INTEL)" $(configure) \
		--cache-file=$(PORTDIR)/config.cache.i386 \
		--without-x ; $(make)
	lipo -create \
		-arch ppc $(BUILDDIR)/src/elinks-ppc \
		-arch i386 $(BUILDDIR)/src/elinks \
		-o $(BUILDDIR)/src/elinks
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
