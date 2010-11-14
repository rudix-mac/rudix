# Library for manipulating PNG images
# http://www.libpng.org/pub/png/
# ?

TITLE=		PNG library $(VERSION)
NAME=		libpng
VERSION=	1.2.40
REVISION=	0
URL=		ftp://ftp.simplesystems.org/pub/libpng/png/src
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking  ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ANNOUNCE,CHANGES,KNOWNBUG,LICENSE,README,TODO} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/lib*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
