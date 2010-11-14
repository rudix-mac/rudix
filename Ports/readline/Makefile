# GNU Readline library
# http://tiswww.case.edu/php/chet/readline/rltop.html
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Readline $(VERSION)
NAME=		readline
VERSION=	6.0
REVISION=	2
URL=		ftp://ftp.cwru.edu/pub/bash/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
CONFIGURE_OPTS=	--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; for x in $(PORTDIR)/readline*-00? ; do \
		patch < $$x ; done
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) --with-curses ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install install-doc
	rm -rf $(INSTALLDIR)/usr/local/share/readline
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGELOG,CHANGES,COPYING,NEWS,README,USAGE} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/*.html $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	chmod u+w $(INSTALLDIR)/usr/local/lib/*.dylib
	$(STRIP_LIB)  $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	$(STRIP_LIB)  $(INSTALLDIR)/usr/local/lib/*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch install
