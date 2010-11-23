# Display dialog boxes from shell scripts
# http://invisible-island.net/dialog/dialog.html
# GPL

include ../../Library/Rules.mk

NAME=		dialog
VERSION=	1.1-20100428
REVISION=	0
URL=		ftp://invisible-island.net/dialog/
SOURCE=		$(NAME)-$(VERSION).tgz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/samples/*.rc $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
