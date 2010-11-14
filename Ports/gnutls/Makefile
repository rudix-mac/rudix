# GNU Transport Layer Security library
# http://www.gnutls.org/
# LGPL

include ../../Library/Rules.mk

TITLE=		GnuTLS $(VERSION)
NAME=		gnutls
VERSION=	2.8.1
REVISION=	0
URL=		http://ftp.gnu.org/gnu/gnutls
SOURCE=		$(NAME)-$(VERSION).tar.bz2

#ifdef WITHOUT_NLS
#NLS=		--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.dylib
#NLS=		--enable-nls
#endif

prep: retrieve
	tar jxvf $(SOURCE)
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
