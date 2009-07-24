# $Id: Makefile,v 1.2 2009/03/05 23:52:09 ruda Exp $

# From Kernighan and Pike: High Order Calculator
# http://cm.bell-labs.com/cm/cs/upe/index.html

NAME=		hoc
VERSION=	1.1
REVISION=	4
URL=		http://netlib.bell-labs.com/~bwk/
SOURCE=		$(NAME).sh

include ../../Library/Rules.mk

prep: retrieve
	mkdir $(BUILDDIR)
	cd $(BUILDDIR) ; sh $(PORTDIR)/hoc.sh ; \
	patch < $(PORTDIR)/hoc-1.1-makefile.patch ; \
	patch < $(PORTDIR)/hoc.y.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make CFLAGS="$(CFLAGS)"
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
