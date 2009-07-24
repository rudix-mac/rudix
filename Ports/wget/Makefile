# $Id: Makefile,v 1.4 2009/07/15 03:19:11 ruda Exp $

# Retrieve files from the web via HTTP, HTTPS and FTP
# http://www.gnu.org/software/wget/
# GPL

NAME=		wget
VERSION=	1.11.4
REVISION=	4
URL=		http://ftp.gnu.org/gnu/wget/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
		$(configure) $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/wgetrc \
		$(INSTALLDIR)/usr/local/etc/wgetrc.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
