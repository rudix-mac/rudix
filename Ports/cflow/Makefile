# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $

# Analyze C source files and print a call graph
# http://www.gnu.org/software/cflow/
# GPL

NAME=		cflow
VERSION=	1.2
REVISION=	0
URL=		$(GNU)/gnu/cflow/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS=	/usr/local/lib/libintl.a
NLS=		--enable-nls
endif

include ../../Library/Rules.mk

LDFLAGS+=	-framework CoreFoundation -liconv

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--disable-dependency-tracking $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
