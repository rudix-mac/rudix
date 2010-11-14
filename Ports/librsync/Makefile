# Library that implements the rsync remote-delta algorithm
# http://librsync.sourceforge.net/
# LGPL

include ../../Library/Rules.mk

NAME=		librsync
VERSION=	0.9.7
REVISION=	8
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
CONFIGURE_OPTS+=	--disable-shared --enable-static
else
CONFIGURE_OPTS+=	--enable-shared --enable-static
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/librsync-0.9.7-universal.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) \
		--disable-dependency-tracking ; $(make) LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
