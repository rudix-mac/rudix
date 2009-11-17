# Mirroring/synchronization over low bandwidth links
# http://samba.org/rsync/
# GPL

include ../../Library/Rules.mk

TITLE=		Rsync $(VERSION)
NAME=		rsync
VERSION=	3.0.6
REVISION=	1
URL=		http://samba.org/ftp/rsync/src/
SOURCE=		$(NAME)-$(VERSION).tar.gz

#DEPENDS=	/usr/local/lib/libpopt.la

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --with-rsyncd-conf=/usr/local/etc ; $(make)
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
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
