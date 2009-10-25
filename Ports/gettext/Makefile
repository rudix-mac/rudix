# GNU GetText
# http://www.gnu.org/software/gettext/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU gettext $(VERSION)
NAME=		gettext
VERSION=	0.17
REVISION=	6
URL=		http://ftp.gnu.org/gnu/gettext/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR)/gettext-runtime/gnulib-lib ; \
		patch < $(PORTDIR)/runtime-setenv.c.patch
	cd $(BUILDDIR)/gettext-tools/gnulib-lib ; \
		patch < $(PORTDIR)/tools-environ.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(STATIC) \
		--enable-threads \
		--disable-csharp ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS} $(INSTALLDOCDIR)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/gettext/examples
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	$(STRIP_LIB)  $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	$(STRIP_LIB)  $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
