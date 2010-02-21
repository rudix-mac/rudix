# Vector graphics library
# http://cairographics.org/
# LGPL

include ../../Library/Rules.mk

NAME=		cairo
VERSION=	1.8.10
REVISION=	0
URL=		http://www.cairographics.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/bin/pkg-config
DEPENDS+=	/usr/local/lib/libpixman-1.la

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" \
	PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/X11R6/lib/pkgconfig" \
	$(configure) \
		--disable-dependency-tracking \
		--with-html-dir=/usr/local/share/doc/cairo ;  $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BIBLIOGRAPHY,BUGS,COPYING*,ChangeLog,HACKING,NEWS,README} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
