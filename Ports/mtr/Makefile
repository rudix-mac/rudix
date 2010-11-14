# Matt's traceroute - network diagnostic tool
# http://www.bitwizard.nl/mtr/
# GPL

include ../../Library/Rules.mk

TITLE=		MTR $(VERSION)
NAME=		mtr
VERSION=	0.80
REVISION=	0
URL=		ftp://ftp.bitwizard.nl/mtr/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	rm -rf $(BUILDDIR)/autom4te.cache $(BUILDDIR)/{.deps,Makefile}
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS) -lresolv" \
	$(configure) \
		--disable-dependency-tracking --without-gtk ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FORMATS,NEWS,README,SECURITY,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/sbin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
