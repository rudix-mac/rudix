# Portable audio output library
# http://xiph.org/ao/
# GPL

include ../../Library/Rules.mk

NAME=		libao
VERSION=	0.8.8
REVISION=	6
URL=		http://downloads.xiph.org/releases/ao/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/bin/pkg-config

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking --enable-static ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make	DESTDIR=$(INSTALLDIR) \
		docdir=$(NSTALLDOCDIR)/usr/local/share/doc/libao install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,README,TODO} $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	strip -x $(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.so
	strip -x $(INSTALLDIR)/usr/local/lib/ao/plugins-2/*.a
	$(TOUCH) install

test: install
	$(TOUCH) test
