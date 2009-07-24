# $Id: Makefile,v 1.5 2009/07/24 00:55:36 ruda Exp $

# GIT - Tree History Storage Tool
# http://git.or.cz/
# GPL

NAME=		git
VERSION=	1.6.3.3
REVISION=	1
URL=		http://www.kernel.org/pub/software/scm/git/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	make configure ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install #install-doc
	rm -rf $(INSTALLDIR)/usr/local/Library
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	find $(INSTALLDIR)/usr/local/bin -type f -exec strip {} \;
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/git"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
