# $Id: Makefile,v 1.3 2009/07/22 00:42:17 ruda Exp $

include ../../Library/Rules.mk

# http://apr.apache.org/
# Apache License

TITLE=		APR Utility $(VERSION)
NAME=		apr-util
VERSION=	1.3.8
REVISION=	0
URL=		http://www.apache.org/dist/apr/
SOURCE=		$(NAME)-$(VERSION).tar.bz2
DEPENDS=	/usr/local/bin/apr-1-config

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--prefix=/usr/local \
		--with-apr=/usr/local/bin/apr-1-config ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,NOTICE,README.MySQL} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/*.a
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/apr-util-1/*.so
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/apr-util-1/*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/apr-util-1/*.so"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/apr-util-1/*.a"
	cd $(BUILDDIR)/test ; make all ; ./testall -v
	$(TOUCH) test
