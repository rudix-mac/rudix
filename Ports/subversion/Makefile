# $Id: Makefile,v 1.4 2009/05/10 15:50:33 ruda Exp $

# http://subversion.tigris.org/
# Subversion revision control system
# 

NAME=		subversion
VERSION=	1.6.1
REVISION=	1
URL=		http://subversion.tigris.org/tarballs/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

DEPENDS=	/usr/local/lib/libintl.dylib
DEPENDS+=	/usr/local/lib/libneon.dylib

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--enable-shared ; $(make)
	$(TOUCH) build

install: build $(DEPENDS)
	cd $(BUILDDIR) ; make \
		DESTDIR=$(INSTALLDIR) \
		APACHE_LIBEXECDIR=$(INSTALLDIR)/usr/local/libexec/apache2 \
		install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,CHANGES,COPYING,README} $(INSTALLDOCDIR)
	rsync -av $(BUILDDIR)/www/* $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	strip -x -S $(INSTALLDIR)/usr/local/libexec/apache2/*.so
	$(TOUCH) install

test: install
	#cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/apache2/*.so"
	otool -L $(INSTALLDIR)/usr/local/lib/libsvn_ra_neon-1.dylib | grep -v '/usr/lib/libneon.26.dylib' > /dev/null
	$(TOUCH) test
