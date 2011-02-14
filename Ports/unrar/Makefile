# http://www.rarlab.com/
# Freeware

include ../../Library/Rules.mk

TITLE=		unRAR $(VERSION)
NAME=		unrar
VERSION=	3.7.8
REVISION=	6
URL=		http://www.rarlab.com/rar/
SOURCE=		$(NAME)src-$(VERSION).tar.gz

README=		$(BUILDDIR)/readme.txt
LICENSE=	$(BUILDDIR)/license.txt

prep: retrieve
	tar zxvf $(SOURCE)
	mv unrar $(NAME)-$(VERSION)
	install -m 644 $(PORTDIR)/makefile.macosx $(BUILDDIR)/Makefile
	touch prep

build: prep
	cd $(BUILDDIR) ; $(make) CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(CFLAGS)"
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/unrar $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{license.txt,readme.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
