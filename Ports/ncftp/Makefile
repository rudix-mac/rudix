# $Id: Makefile,v 1.2 2009/03/06 02:00:39 ruda Exp $

# Ftp replacement with advanced user interface
# http://www.ncftp.com/
# The Clarified Artistic License

NAME=		ncftp
VERSION=	3.2.2
REVISION=	2
SOURCE=		$(NAME)-$(VERSION)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp
#URL=		ftp://ftp.mirror.ac.uk/mirror/ftp.ncftp.com/ncftp

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/configure.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{DONATE.txt,README.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{CHANGELOG.txt,what_changed_between_v2_v3.txt,FIREWALLS_AND_PROXIES.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/html/* $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
