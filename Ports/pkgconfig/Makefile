# Tool for managing library compile/link flags
# http://pkgconfig.freedesktop.org/wiki/
# GPL

include ../../Library/Rules.mk

NAME=		pkg-config
VERSION=	0.23
REVISION=	3
URL=		http://pkgconfig.freedesktop.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/pkg-config
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/pkg-config -verify_arch i386 ppc7400
	$(TOUCH) test
