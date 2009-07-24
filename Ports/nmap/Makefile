# $Id: Makefile,v 1.3 2009/07/17 23:31:13 ruda Exp $

# Scan ports and fingerprint stack of network hosts
# http://nmap.org/
# GPL

NAME=		nmap
VERSION=	5.00
REVISION=	0intel
URL=		http://nmap.org/dist/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

ifdef WITH_EXTERNAL_PCRE
PCRE=		--with-libpcre=/usr/local
DEPENDS+=	/usr/local/lib/libpcre.la
else
PCRE=		--with-libpcre=included
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) \
		--disable-dependency-tracking \
		--without-zenmap $(PCRE) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,HACKING} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/*.txt $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
