# $Id: Makefile,v 1.2 2009/03/22 22:30:03 ruda Exp $

NAME=		tree
VERSION=	1.5.2.2
REVISION=	0
URL=		ftp://mama.indstate.edu/linux/tree/
SOURCE=		$(NAME)-$(VERSION).tgz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	cp strverscmp.c $(BUILDDIR)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make prefix=$(INSTALLDIR)/usr/local \
		MANDIR=$(INSTALLDIR)/usr/local/share/man/man1 install
	install -d $(INSTALLDOCDIR)
	install -m 644  $(BUILDDIR)/{CHANGES,LICENSE,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
