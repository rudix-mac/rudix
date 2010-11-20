# GNU GetText
# http://www.gnu.org/software/gettext/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU gettext $(VERSION)
NAME=		gettext
VERSION=	0.18.1.1
REVISION=	1
URL=		http://ftp.gnu.org/gnu/gettext/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(STATIC) \
		--enable-threads \
		--disable-csharp \
		--with-included-glib ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,THANKS} $(INSTALLDOCDIR)
	rm -rf $(INSTALLDIR)/usr/local/share/doc/gettext/examples
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x  $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x  $(INSTALLDIR)/usr/local/lib/*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
