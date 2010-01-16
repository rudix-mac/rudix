# Low-level data structures and memory management
# http://www.dict.org/
# LGPL

NAME=		libmaa
VERSION=	1.2.0
REVISION=	0
URL=		http://downloads.sourceforge.net/dict
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env LIBTOOL=glibtool CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING*,ChangeLog,NEWS,README,arggram.txt} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/libmaa.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/libmaa.a"
	$(TOUCH) test
