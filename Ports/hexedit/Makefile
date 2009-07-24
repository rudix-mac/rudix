# $Id: Makefile,v 1.2 2009/03/05 23:43:53 ruda Exp $

# View and edit files in hexadecimal or ASCII
# http://www.chez.com/prigaux/hexedit.html
# 

NAME=		hexedit
VERSION=	1.2.12
REVISION=	3
URL=		http://www.chez.com/prigaux/
SOURCE=		$(NAME)-$(VERSION).src.tgz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	mv hexedit $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local mandir=$(INSTALLDIR)/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,Changes,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
