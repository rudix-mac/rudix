# HTTP and WebDAV client library, with C interface
# http://www.webdav.org/neon/
# LGPL

include ../../Library/Rules.mk

TITLE=		neon $(VERSION)
NAME=		neon
VERSION=	0.29.3
REVISION=	0
URL=		http://www.webdav.org/neon/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
CONFIG_OPTS=	--disable-nls
else
CONFIG_OPTS=	--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/docdir_realplace.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--enable-threadsafe-ssl \
		--with-ssl \
		--with-expat ; $(make)
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
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/test ; make check
	$(TOUCH) test
