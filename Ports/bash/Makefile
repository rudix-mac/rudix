# $Id: Makefile,v 1.4 2009/07/24 00:55:36 ruda Exp $

# NOTE: bash is compiled with readline in their sources

# GNU Bourne Again Shell
# http://www.gnu.org/software/bash/
# GPL

NAME=		bash
VERSION=	4.0
REVISION=	0intel
URL=		http://ftp.gnu.org/gnu/bash/
SOURCE=		bash-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CHANGES,COMPAT,COPYING,NEWS,NOTES,POSIX,RBASH,README,Y2K} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/bash
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
