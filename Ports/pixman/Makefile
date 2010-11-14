# The pixman library (version 1)
# http://cairographics.org/
# BSD

include ../../Library/Rules.mk

NAME=		pixman
VERSION=	0.17.6
REVISION=	0
URL=		http://www.cairographics.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,TODO} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard "$(INSTALLDIR)/usr/local/lib/lib*.dylib") ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard "$(INSTALLDIR)/usr/local/lib/lib*.a") ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
