# $Id: Makefile,v 1.2 2009/03/15 19:15:44 ruda Exp $

# Mirroring/synchronization over low bandwidth links
# http://samba.org/rsync/
# GPL

NAME=		rsync
VERSION=	3.0.5
REVISION=	0
URL=		http://samba.org/ftp/rsync/src/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libpopt.0.0.0.dylib

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--with-rsyncd-conf=/usr/local/etc ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf rsync rsync3
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf rsync.1 rsync3.1
	cd $(INSTALLDIR)/usr/local/share/man/man5 ; ln -sf rsyncd.conf.5 rsyncd3.conf.5
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
