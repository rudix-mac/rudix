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

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAG)" \
	$(configure) \
		--prefix=/usr/local \
		--with-installbuilddir=/usr/local/share/apr-1/build-1 \
		--enable-threads ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,LICENSE,NOTICE,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/docs/* $(INSTALLDOCDIR)
	strip -x $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR)/test ; make all ; ./testall -v
	$(TOUCH) test
