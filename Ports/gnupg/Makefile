# The GNU Privacy Guard
# http://gnupg.org/
# GPL

include ../../Library/Rules.mk

TITLE=		GnuPG $(VERSION)
NAME=		gnupg
VERSION=	1.4.10
REVISION=	0.i386
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,COPYING,ChangeLog,NEWS,PROJECTS,README,THANKS,TODO,VERSION} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{DETAILS,FAQ,HACKING,*.html,*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/libexec/gnupg/*
	touch install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/gnupg/*"
	touch test
