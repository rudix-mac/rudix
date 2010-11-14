# Apache Portable Runtime Utility
# http://apr.apache.org/
# Apache License

include ../../Library/Rules.mk

TITLE=		APR Utility $(VERSION)
NAME=		apr-util
VERSION=	1.3.9
REVISION=	2
URL=		http://www.apache.org/dist/apr/
SOURCE=		$(NAME)-$(VERSION).tar.bz2
DEPENDS=	/usr/local/bin/apr-1-config

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--prefix=/usr/local \
		--with-apr=/usr/local/bin/apr-1-config ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,NOTICE,README} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/apr-util-1/*.so
endif
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	strip -x $(INSTALLDIR)/usr/local/lib/apr-util-1/*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/apr-util-1/*.so) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do  \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/apr-util-1/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/test ; make all ; ./testall -v
	touch test
