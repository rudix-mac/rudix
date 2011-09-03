# (E)nhanced (P)rogrammable (I)RC-II (C)lient
# http://www.epicsol.org/
# BSD

# FIXME: archive.h and archive_entry.h are missing although libarchide.dylib
#        is there in Mac OS X, so you must find and copy the files to
# 	 /usr/local/include
# NOTE: can't do $(make)

include ../../Library/Rules.mk

NAME=		epic5
VERSION=	1.1.2
REVISION=	0
URL=		http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYRIGHT

# Need this to compile with Perl
CFLAGS+=	-arch ppc
LDFLAGS+=	-arch ppc

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make IP=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf epic5 irc
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf epic5.1 irc.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUG_FORM,COPYRIGHT,KNOWNBUGS,README,UPDATES,VOTES} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/libexec/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/libexec/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
