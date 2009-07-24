# $Id: Makefile,v 1.2 2009/03/21 21:24:30 ruda Exp $

HOMEPAGE=	http://gnupg.org/

NAME=		gnupg
VERSION=	1.4.9
REVISION=	4
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--disable-asm ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,COPYING,ChangeLog,NEWS,PROJECTS,README,THANKS,TODO,VERSION} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{DETAILS,FAQ,HACKING,*.html,*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/libexec/gnupg/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/gnupg/*"
	$(TOUCH) test
