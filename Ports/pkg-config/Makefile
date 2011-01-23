# Tool for managing library compile/link flags
# http://pkgconfig.freedesktop.org/wiki/
# GPL

include ../../Library/Rules.mk

TITLE=		pkg-config $(VERSION)
NAME=		pkg-config
VERSION=	0.25
REVISION=	1
URL=		http://pkgconfig.freedesktop.org/releases/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/pkg-config
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/pkg-config -verify_arch i386 x86_64
	touch test
