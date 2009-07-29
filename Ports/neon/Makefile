# $Id: Makefile,v 1.3 2009/05/10 15:49:40 ruda Exp $

# HTTP and WebDAV client library, with C interface
# http://www.webdav.org/neon/

TITLE=		neon $(VERSION)
NAME=		neon
VERSION=	0.28.5
REVISION=	0
URL=		http://www.webdav.org/neon/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/docdir_realplace.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(STATIC) \
		--enable-threadsafe-ssl \
		--with-ssl --with-expat $(NLS); $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/html/* $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	#cd $(BUILDDIR)/test ; make check
	$(TOUCH) test
