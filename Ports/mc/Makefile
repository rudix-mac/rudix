# Free Norton Commander clone with many useful features
# http://www.midnight-commander.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Midnight Commander $(VERSION)
NAME=		mc
VERSION=	4.7.1
REVISION=	1
URL=		http://www.midnight-commander.org/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.gz

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
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--with-screen=ncurses ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/mc \
		$(INSTALLDIR)/usr/local/etc/mc.default
	install -d $(INSTALLDIR)/usr/local/etc/mc
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{FAQ,HACKING,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
