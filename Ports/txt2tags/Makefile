# $Id: Makefile,v 1.2 2009/03/22 22:19:20 ruda Exp $

# Utility to turn simply formatted text into markup
# http://txt2tags.sourceforge.net/

NAME=		txt2tags
VERSION=	2.5
REVISION=	2
URL=		$(SOURCEFORGE)txt2tags
SOURCE=		$(NAME)-$(VERSION).tgz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/bin/msgfmt

prep: retrieve
	tar zxvf $(SOURCE)
	cp $(PORTDIR)/txt2tags.Makefile $(BUILDDIR)/Makefile
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/doc/manpage.man $(INSTALLDIR)/usr/local/share/man/man1/txt2tags.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,ChangeLog,README,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	install -d $(INSTALLDIR)/usr/local/lib/txt2tags
	install -m 644 $(BUILDDIR)/extras/* $(INSTALLDIR)/usr/local/lib/txt2tags
	$(TOUCH) install

test: install
	cd $(BUILDDIR)/test ; python run.py
	$(TOUCH) test
