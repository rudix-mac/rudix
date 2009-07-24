# $Id: Makefile,v 1.2 2009/03/05 19:09:19 ruda Exp $

# Display dialog boxes from shell scripts
# http://invisible-island.net/dialog/dialog.html
# GPL

NAME=		dialog
VERSION=	1.1-20080819
REVISION=	1
URL=		ftp://invisible-island.net/dialog/
SOURCE=		$(NAME)-$(VERSION).tgz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/samples/*.rc $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
