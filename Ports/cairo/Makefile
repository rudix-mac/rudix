# Vector graphics library
# http://cairographics.org/
# LGPL

include ../../Library/Rules.mk

NAME=		cairo
VERSION=	1.10.0
REVISION=	0
URL=		http://www.cairographics.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libpixman-1.la

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
	  PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/X11R6/lib/pkgconfig" \
	$(configure) $(CONFIG_OPTS) \
		--disable-dependency-tracking \
		--with-html-dir=/usr/local/share/doc/cairo ;  $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BIBLIOGRAPHY,BUGS,COPYING*,ChangeLog,HACKING,NEWS} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
