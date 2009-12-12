# Berkeley DB
# http://www.oracle.com/technology/products/berkeley-db/
# BSD

include ../../Library/Rules.mk

TITLE=		Berkeley DB $(VERSION)
NAME=		db
VERSION=	4.8.24
REVISION=	0
URL=		http://download.oracle.com/berkeley-db/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR)/build_unix ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	../dist/$(configure) 	\
		--prefix=/usr/local			\
		--docdir=/usr/local/share/doc/db	\
		--enable-compat185 			\
		--enable-dump185 			\
		--enable-cxx 				\
		--enable-java ;				\
	$(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR)/build_unix ; \
	make DESTDIR=$(INSTALLDIR) docdir=/usr/local/share/doc/db install
	chmod +w $(INSTALLDIR)/usr/local/bin/*
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
