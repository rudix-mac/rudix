# $Id: Makefile,v 1.2 2009/03/25 02:33:26 ruda Exp $

# Print a random permutation of the argument list
# http://code.google.com/p/shuffle-argv/
# BSD

NAME=		shuffle
VERSION=	1.0.1
REVISION=	0
URL=		http://shuffle-argv.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(make) CFLAGS_EXTRA="$(CFLAGS)"
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make PREFIX=$(INSTALLDIR)/usr/local install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{README,LICENSE} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
