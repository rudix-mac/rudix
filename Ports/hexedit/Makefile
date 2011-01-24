# View and edit files in hexadecimal or ASCII
# http://www.chez.com/prigaux/hexedit.html
# GPL

include ../../Library/Rules.mk

NAME=		hexedit
VERSION=	1.2.12
REVISION=	5
URL=		http://www.chez.com/prigaux/
SOURCE=		$(NAME)-$(VERSION).src.tgz

README=		$(PORTDIR)/ReadMe.txt
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	mv hexedit $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local mandir=$(INSTALLDIR)/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,Changes,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
