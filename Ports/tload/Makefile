# A gentle spin-off of procps's tload for Mac OS X
# http://code.google.com/p/tload-macosx/
# GPL

NAME=		tload
VERSION=	3.2.7
REVISION=	5
URL=		http://tload-macosx.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make PREFIX=$(INSTALLDIR)/usr/local install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
