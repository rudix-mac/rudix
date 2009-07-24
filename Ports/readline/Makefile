# $Id: Makefile,v 1.4 2009/07/15 02:18:22 ruda Exp $

# GNU Readline library
# http://tiswww.case.edu/php/chet/readline/rltop.html
# GPL

NAME=		readline
VERSION=	6.0
REVISION=	1
URL=		ftp://ftp.cwru.edu/pub/bash/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; for x in $(PORTDIR)/readline*-00? ; do \
		patch < $$x ; done
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(STATIC) \
		--with-curses ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install install-doc
	rm -rf $(INSTALLDIR)/usr/local/share/readline
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGELOG,CHANGES,COPYING,NEWS,README,USAGE} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/*.html $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	chmod u+w $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x -S  $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(TOUCH) install
