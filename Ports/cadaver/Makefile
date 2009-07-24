# $Id: Makefile,v 1.4 2009/07/24 00:55:36 ruda Exp $

include ../../Library/Rules.mk

# Command-line WebDAV client
# http://www.webdav.org/cadaver/
# GPL

NAME=		cadaver
VERSION=	0.23.2
REVISION=	4
URL=		http://www.webdav.org/cadaver/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS+=	/usr/local/lib/libintl.la
NLS=		--enable-nls
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--with-ssl $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make 	prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man  install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,COPYING,ChangeLog,FAQ,INTEROP,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
