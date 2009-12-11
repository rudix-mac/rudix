# Callback framework for C++
# http://libsigc.sourceforge.net/
# LGPL

include ../../Library/Rules.mk

NAME=		libsigc++
VERSION=	2.2.4.2
REVISION=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/bin/pkg-config

ifdef STATIC_ONLY
CONFIGURE_OPTS=		--enable-static --disable-shared
else
CONFIGURE_OPTS=		--enable-static --enable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
