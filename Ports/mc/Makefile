# $Id: Makefile,v 1.3 2009/07/20 00:24:00 ruda Exp $

# Free Norton Commander clone with many useful features
# http://www.midnight-commander.org/

NAME=		mc
VERSION=	4.6.1
REVISION=	5
URL=		http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS+=	/usr/local/lib/libglib-2.0.la
DEPENDS+=	/usr/local/lib/libintl.la

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif
ifdef WITH_STATIC_GLIB
LDFLAGS+=	-framework Carbon -framework CoreServices
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--with-screen=ncurses ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FAQ,HACKING,MAINTAINERS,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test

distpkg:
	$(PACKAGEMAKER) --doc $(NAME)-dist.pmdoc -i $(VENDOR).$(NAME) -o $(NAME).mpkg
	$(TOUCH) distpkg
distdmg: distpkg
	$(CREATEDMG) -srcfolder $(NAME).mpkg $(NAME)-$(VERSION)-$(REVISION).dmg
	$(TOUCH) distdmg
