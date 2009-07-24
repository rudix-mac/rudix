# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $

# Matt's traceroute - network diagnostic tool
# http://www.bitwizard.nl/mtr/
# GPL

NAME=		mtr
VERSION=	0.75
REVISION=	2
URL=		ftp://ftp.bitwizard.nl/mtr/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	rm -rf $(BUILDDIR)/autom4te.cache $(BUILDDIR)/{.deps,Makefile}
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--without-gtk ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FORMATS,NEWS,README,SECURITY,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/sbin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	$(TOUCH) test
