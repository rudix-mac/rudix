# Code browsing program
# http://cscope.sourceforge.net/
# BSD

include ../../Library/Rules.mk

TITLE=		Cscope $(VERSION)
NAME=		cscope
VERSION=	15.7a
REVISION=	1
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR)/src ; patch < $(PORTDIR)/constants.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure)  --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/cscope -verify_arch i386 x86_64
	touch test
