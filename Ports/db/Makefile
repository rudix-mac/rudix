# Berkeley DB
# http://www.oracle.com/technology/products/berkeley-db/
# BSD

include ../../Library/Rules.mk

TITLE=		Berkeley DB $(VERSION)
NAME=		db
VERSION=	5.1.19
REVISION=	0
URL=		http://download.oracle.com/berkeley-db/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared --enable-java
endif

prep: retrieve
	tar zxf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR)/build_unix ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	../dist/$(configure) $(CONFIG_OPTS)		\
		--prefix=/usr/local			\
		--docdir=/usr/local/share/doc/db	\
		--enable-compat185 --enable-dump185 	\
		--enable-cxx ;				\
	$(make)
	touch build

install: build
	cd $(BUILDDIR)/build_unix ; \
	make DESTDIR=$(INSTALLDIR) docdir=/usr/local/share/doc/db install
	chmod +w $(INSTALLDIR)/usr/local/bin/*
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
