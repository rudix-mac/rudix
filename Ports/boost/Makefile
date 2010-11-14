# free peer-reviewed portable C++ source libraries
# http://www.boost.org/
# MIT-like 

include ../../Library/Rules.mk

TITLE=		Boost C++ Libraries
NAME=		boost
VERSION=	1.43.0
REVISION=	0
URL=		http://downloads.sourceforge.net/boost
SOURCE=		$(NAME)_1_43_0.tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	mv $(NAME)_1_43_0 $(NAME)-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./bootstrap.sh ; \
	./bjam toolset=darwin architecture=x86 address-model=32_64
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/tools/jam/src/bin.*/bjam $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/lib
	install -m 644 $(BUILDDIR)/stage/lib/lib*.dylib $(INSTALLDIR)/usr/local/lib
	cd $(BUILDDIR)/stage/lib ; (tar -cv lib*.dylib | tar -xv -C $(INSTALLDIR)/usr/local/lib)
	install -m 644 $(BUILDDIR)/stage/lib/lib*.a $(INSTALLDIR)/usr/local/lib
	cd $(BUILDDIR) ; find boost -type d -exec install -d $(INSTALLDIR)/usr/local/include/{} \;
	cd $(BUILDDIR) ; find boost ! -name \*.orig -type f -exec install -m 644 {} $(INSTALLDIR)/usr/local/include/{} \;
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE_1_0.txt,index.*} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	#for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
	#	lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
