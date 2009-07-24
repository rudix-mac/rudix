# $Id: Makefile,v 1.2 2009/03/21 19:53:23 ruda Exp $

# Command-line MPEG audio decoder and player
# http://www.underbit.com/products/mad/
# GPL

NAME=		madplay
VERSION=	0.15.2b
REVISION=	13intel
URL=		$(SOURCEFORGE)mad
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/lib/libmad.dylib
DEPENDS+=	/usr/local/lib/libid3tag.dylib

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; \
	patch < $(PORTDIR)/madplay-0.15.2b-configure.patch ; \
	patch < $(PORTDIR)/madplay-0.15.2b-audio_carbon.c.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS_INTEL)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,COPYRIGHT,CREDITS,README,TODO} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
