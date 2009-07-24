# $Id: Makefile,v 1.2 2009/03/21 21:50:28 ruda Exp $

# The Public Domain Korn Shell
# http://web.cs.mun.ca/~michael/pdksh/

NAME=		pdksh
VERSION=	5.2.14
REVISION=	13
URL=		http://ftp.at.gnucash.org/utils/shells/pdksh/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; \
	patch < $(PORTDIR)/pdksh-5.2.14-patches.1 ; \
	patch < $(PORTDIR)/pdksh-5.2.14-patches.2 ; \
	patch < $(PORTDIR)/siglist.sh.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local mandir=$(INSTALLDIR)/usr/local/share/man/man1 install
	cd $(INSTALLDIR)/usr/local/bin ; mv ksh pdksh
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; mv ksh.1 pdksh.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUG-REPORTS,CONTRIBUTORS,ChangeLog,LEGAL,NEWS,NOTES,PROJECTS,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/etc/* $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
