# $Id: Makefile,v 1.3 2009/03/27 01:26:56 ruda Exp $

include ../../Library/Rules.mk

# http://rudix.org/
# BSD

TITLE=		Rudix Package Manager $(VERSION)
NAME=		rudix
VERSION=	2.1.1
REVISION=	0

build: rudix.pdf
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/sbin
	sed "s/@VERSION@/$(VERSION)/" $(PORTDIR)/rudix > $(INSTALLDIR)/usr/local/sbin/rudix
	chmod 755 $(INSTALLDIR)/usr/local/sbin/rudix
	install -m 755  rudix-compat $(INSTALLDIR)/usr/local/sbin
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 rudix.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 rudix.pdf $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	perl -c $(INSTALLDIR)/usr/local/sbin/rudix
	$(TOUCH) test

rudix.pdf: rudix.1
	groff -mandoc rudix.1 > rudix.ps
	pstopdf rudix.ps -o rudix.pdf
