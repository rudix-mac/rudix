# $Id: Makefile,v 1.3 2009/03/01 22:43:41 ruda Exp $

# Code browsing program
# http://cscope.sourceforge.net/
# BSD

NAME=		cscope
VERSION=	15.7
REVISION=	0
URL=		$(SOURCEFORGE)cscope
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR)/src ; patch < $(PORTDIR)/constants.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure)  \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install
