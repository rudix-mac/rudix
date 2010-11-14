# Complete rewrite of the NASM assembler
# http://www.tortall.net/projects/yasm/
# BSD

include ../../Library/Rules.mk

TITLE=		Yasm $(VERSION)
NAME=		yasm
VERSION=	1.1.0
REVISION=	0
URL=		http://www.tortall.net/projects/yasm/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,GNU*,*.txt,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
