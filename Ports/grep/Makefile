# $Id: Makefile,v 1.2 2009/03/05 23:32:25 ruda Exp $

# GNU versions of grep pattern matching utilities
# http://www.gnu.org/software/grep/
# GPL

NAME=		grep
VERSION=	2.5.4
REVISION=	0
URL=		$(GNU)/gnu/grep/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS+=	/usr/local/lib/libintl.dylib
NLS=		--enable-nls
endif

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR)/po ; patch < $(PORTDIR)/Makefile.in.in.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--program-prefix=gnu ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	./links.sh $(INSTALLDIR)/usr/local/bin
	./links.sh $(INSTALLDIR)/usr/local/share/man/man1
	cd $(INSTALLDIR)/usr/local/share/info ; ln -sf grep.info gnugrep.info
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	#cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) install
