# View and edit files in hexadecimal or ASCII
# http://www.chez.com/prigaux/hexedit.html
# GPL

include ../../Library/Rules.mk

NAME=		hexedit
VERSION=	1.2.12
REVISION=	4
URL=		http://www.chez.com/prigaux/
SOURCE=		$(NAME)-$(VERSION).src.tgz

prep: retrieve
	tar zxvf $(SOURCE)
	mv hexedit $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local mandir=$(INSTALLDIR)/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,Changes,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
