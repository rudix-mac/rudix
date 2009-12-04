# Mpeg audio 1/2 layer 1, 2 and 3 player
# http://www.mpg123.de/
# 

include ../../Library/Rules.mk

NAME=		mpg123
VERSION=	1.9.2
REVISION=	0
URL=		http://downloads.sourceforge.net/mpg123
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -rf $(BUILDDIR)/doc/examples/
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,doc/*} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/mpg123/*.so
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/mpg123/*.so"
	$(TOUCH) test
