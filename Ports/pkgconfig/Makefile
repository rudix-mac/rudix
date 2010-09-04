# Tool for managing library compile/link flags
# http://pkgconfig.freedesktop.org/wiki/
# GPL

include ../../Library/Rules.mk

TITLE=		pkg-config $(VERSION)
NAME=		pkg-config
VERSION=	0.25
REVISION=	0
URL=		http://pkgconfig.freedesktop.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/pkg-config
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/pkg-config -verify_arch i386 x86_64
	$(TOUCH) test
