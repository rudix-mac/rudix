# $Id: Makefile,v 1.2 2009/03/22 00:30:06 ruda Exp $

# File compressor with a high compression ratio
# http://rzip.samba.org/
# GPL

NAME=		rzip
VERSION=	2.1
REVISION=	13
URL=		http://rzip.samba.org/ftp/rzip/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local INSTALL_MAN=$(INSTALLDIR)/usr/local/share/man install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf rzip runzip
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf rzip.1 runzip.1
	install -d $(INSTALLDOCDIR)
	install $(BUILDDIR)/COPYING $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
