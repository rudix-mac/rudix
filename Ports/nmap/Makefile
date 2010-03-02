# Scan ports and fingerprint stack of network hosts
# http://nmap.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Nmap $(VERSION)
NAME=		nmap
VERSION=	5.20
REVISION=	0
URL=		http://nmap.org/dist/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)"  \
	$(configure) --disable-dependency-tracking --without-zenmap ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,HACKING} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/*.txt $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
