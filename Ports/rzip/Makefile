# File compressor with a high compression ratio
# http://rzip.samba.org/
# GPL

include ../../Library/Rules.mk

NAME=		rzip
VERSION=	2.1
REVISION=	14
URL=		http://rzip.samba.org/ftp/rzip/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(PORTDIR)/ReadMe.txt
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local INSTALL_MAN=$(INSTALLDIR)/usr/local/share/man install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf rzip runzip
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf rzip.1 runzip.1
	install -d $(INSTALLDOCDIR)
	install $(BUILDDIR)/COPYING $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
