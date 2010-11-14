# HTTP tunneling utility
# http://www.nocrew.org/software/httptunnel/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU httptunnel $(VERSION)
NAME=		httptunnel
VERSION=	3.3
REVISION=	1
URL=		http://www.nocrew.org/software/httptunnel/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,DISCLAIMER,FAQ,HACKING,NEWS,README,TODO,doc/*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
