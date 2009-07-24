# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $

# GNU core utilities
# http://www.gnu.org/software/coreutils/
# GPL

NAME=		coreutils
VERSION=	7.4
REVISION=	0
URL=		$(GNU)/gnu/coreutils/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS+=	/usr/local/lib/libintl.dylib
NLS=		--enable-nls
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		jm_cv_func_svid_putenv=yes \
		--disable-dependency-tracking \
		--program-prefix=gnu $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	$(PORTDIR)/mklinks.sh $(INSTALLDIR)/usr/local/bin
	$(PORTDIR)/mklinks.sh $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/gnu*"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
