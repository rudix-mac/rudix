# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $

include ../../Library/Rules.mk

# http://www.rarlab.com/
# Freeware

TITLE=		unRAR $(VERSION)
NAME=		unrar
VERSION=	3.7.8
REVISION=	4
URL=		http://www.rarlab.com/rar/
SOURCE=		$(NAME)src-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv unrar $(NAME)-$(VERSION)
	install -m 644 $(PORTDIR)/makefile.macosx $(BUILDDIR)/Makefile
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(make) CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(CFLAGS)"
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/unrar $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{license.txt,readme.txt} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
