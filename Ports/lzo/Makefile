# Portable speedy lossless data compression library
# http://www.oberhumer.com/opensource/lzo/
# GPL

include ../../Library/Rules.mk

TITLE=		LZO $(VERSION)
NAME=		lzo
VERSION=	2.03
REVISION=	0
URL=		http://www.oberhumer.com/opensource/lzo/download/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef STATIC_ONLY
CONFIGURE_OPTS=		--enable-static --disable-shared
else
CONFIGURE_OPTS=		--enable-static --enable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

ifndef STATIC_ONLY
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
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
