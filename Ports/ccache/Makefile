# $Id: Makefile,v 1.4 2009/07/24 00:55:36 ruda Exp $
# http://ccache.samba.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Compiler Cache $(VERSION)
NAME=		ccache
VERSION=	2.4
REVISION=	17
URL=		http://samba.org/ftp/ccache/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; \
	patch < $(PORTDIR)/universal-binary-support.patch ; \
	patch < $(PORTDIR)/patch-util_c
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/libexec/ccache
	cd $(INSTALLDIR)/usr/local/libexec/ccache ; \
	for x in c++ cc g++ gcc ; do \
		ln -sf /usr/local/bin/ccache $$x ; \
	done
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/web/*.html $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
