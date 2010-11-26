# GNU M4
# http://www.gnu.org/software/m4/
# GPL

# NOTE: GNU m4 doesn't requires gettext

include ../../Library/Rules.mk

TITLE=		GNU M4 $(VERSION)
NAME=		m4
VERSION=	1.4.15
REVISION=	1
URL=		http://ftp.gnu.org/gnu/m4/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf m4 gm4
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf m4.1 gm4.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch install
