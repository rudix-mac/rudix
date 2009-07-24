# $Id: Makefile,v 1.2 2009/03/06 00:33:15 ruda Exp $

# Convert HTML pages to PDF/PS format
# http://www.htmldoc.org/

NAME=		htmldoc
VERSION=	1.8.27
REVISION=	10
URL=		http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/$(VERSION)/
SOURCE=		$(NAME)-$(VERSION)-source.tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--prefix=/usr/local \
		--bindir=/usr/local/bin ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make \
		prefix=$(INSTALLDIR)/usr/local \
		bindir=$(INSTALLDIR)/usr/local/bin \
		mandir=$(INSTALLDIR)/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES.txt,COPYING.txt,README.txt,htmldoc.eula} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
