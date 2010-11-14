# Apache Portable Runtime library
# http://apr.apache.org/
# Apache License

include ../../Library/Rules.mk

TITLE=		Apache Portable Runtime $(VERSION)
NAME=		apr
VERSION=	1.4.2
REVISION=	0
URL=		http://www.apache.org/dist/apr
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
endif

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAG)" \
	$(configure) $(CONFIG_OPTS) \
		--prefix=/usr/local \
		--with-installbuilddir=/usr/local/share/apr-1/build-1 \
		--enable-threads ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,NOTICE,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/* $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x $(INSTALLDIR)/usr/local/lib/*.dylib
endif
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	touch install

test: install
ifndef STATIC_ONLY
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
endif
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/test ; make all ; ./testall -v
	touch test
