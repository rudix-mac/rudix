# Utility to turn simply formatted text into markup
# http://txt2tags.org/
# GPL

include ../../Library/Rules.mk

NAME=		txt2tags
VERSION=	2.6
REVISION=	0
URL=		http://txt2tags.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tgz

DEPENDS=	/usr/local/bin/msgfmt

prep: retrieve
	tar zxvf $(SOURCE)
	cp $(PORTDIR)/txt2tags.Makefile $(BUILDDIR)/Makefile
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/doc/manpage.man $(INSTALLDIR)/usr/local/share/man/man1/txt2tags.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,ChangeLog,README,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	install -d $(INSTALLDIR)/usr/local/lib/txt2tags
	install -m 644 $(BUILDDIR)/extras/* $(INSTALLDIR)/usr/local/lib/txt2tags
	touch install

test: install
	cd $(BUILDDIR)/test ; ./run.py
	touch test
