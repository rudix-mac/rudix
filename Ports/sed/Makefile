# $Id: Makefile,v 1.2 2009/03/22 00:29:08 ruda Exp $

HOMEPAGE=	http://www.gnu.org/software/sed/

NAME=		sed
VERSION=	4.1.5
REVISION=	12
URL=		$(GNU)/gnu/sed/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.dylib
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/gettext-fix-hack.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--program-prefix=gnu ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf gnused sed
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf gnused.1 sed.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,COPYING,NEWS,README,THANKS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
