# $Id: Makefile.GNU,v 1.1 2009/05/03 14:35:03 ruda Exp $

# GRaphing, Advanced Computation and Exploration of data
# http://plasma-gate.weizmann.ac.il/Grace/
# 

NAME=		grace
VERSION=	5.1.22
REVISION=	0
URL=		ftp://plasma-gate.weizmann.ac.il/pub/grace/src/grace5/
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

#FETCH+=        --disable-epsv
prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

	#strip $(INSTALLDIR)/usr/local/bin/*
	#strip $(INSTALLDIR)/usr/local/sbin/*
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	cd $(BUILDDIR) ; make check
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
