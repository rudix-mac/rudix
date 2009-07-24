# $Id: Makefile,v 1.2 2009/03/06 13:52:29 ruda Exp $

# Finds and then operates on files
# http://www.gnu.org/software/findutils/
# GPL

NAME=		findutils
VERSION=	4.4.0
REVISION=	4
URL=		$(GNU)/gnu/findutils/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--program-prefix=gnu \
		--with-included-regex ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	./links.sh $(INSTALLDIR)/usr/local/bin
	./links.sh $(INSTALLDIR)/usr/local/share/man/man1
	./links.sh $(INSTALLDIR)/usr/local/share/man/man5
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	cd $(INSTALLDIR)/usr/local/share/info ; ln -sf find.info gnufind.info
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/libexec/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/*"
	$(TOUCH) test
