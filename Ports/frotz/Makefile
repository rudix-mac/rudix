# $Id: Makefile,v 1.2 2009/03/06 14:20:03 ruda Exp $

# Curses-based interpreter for Infocom-compatible games
# http://frotz.sourceforge.net/

NAME=		frotz
VERSION=	2.43
REVISION=	4
URL=		$(SOURCEFORGE)frotz
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/frotz-2.43-Makefile.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" all
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make	LDFLAGS="$(LDFLAGS)" \
		PREFIX=$(INSTALLDIR)/usr/local \
		MAN_PREFIX=$(INSTALLDIR)/usr/local/share/man install \
		install_dumb
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,HOW_TO_PLAY,README,TODO,doc/*.conf*} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
