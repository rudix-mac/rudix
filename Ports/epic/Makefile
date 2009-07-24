# $Id: Makefile,v 1.2 2009/03/21 01:54:15 ruda Exp $

# (E)nhanced (P)rogrammable (I)RC-II (C)lient

HOMEPAGE=	http://www.epicsol.org/

NAME=		epic5
VERSION=	1.0
REVISION=	0
URL=		http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make IP=$(INSTALLDIR) install
	#cd $(INSTALLDIR)/usr/local/bin ; ln -sf epic irc
	#cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf epic.1 irc.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUG_FORM,COPYRIGHT,KNOWNBUGS,README,UPDATES,VOTES} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/libexec/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/*"
	$(TOUCH) test
