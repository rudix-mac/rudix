# $Id: Makefile,v 1.6 2009/07/24 00:55:36 ruda Exp $

include ../../Library/Rules.mk

# Makefile for a new port
# http://rudix.org/
# License here (GPL, LGPL, BSD, Apache, etc.)

TITLE=		Template $(VERSION)
NAME=		template
VERSION=	1.2.3
REVISION=	0
URL=		http://path/to/download/
#URL=		http://downloads.sourceforge.net/template
#URL=		http://ftp.gnu.org/gnu/
SOURCE=		$(NAME)-$(VERSION).tar.gz
#SOURCE=	$(NAME)-$(VERSION).tar.bz2
#SOURCE=	$(NAME)-$(VERSION).tar.Z
#SOURCE=	$(NAME)-$(VERSION).zip

#ifdef WITHOUT_NLS
#NLS=		--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.la
#NLS=		--enable-nls
#endif

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

# Sometimes required to access FTP sites
#FETCH+=	--disable-epsv

#
# Preparing to build: extract source and apply patches
#
prep: retrieve
	tar zxvf $(SOURCE)
	#tar jxvf $(SOURCE)
	#unzip $(SOURCE)
	#cd $(BUILDDIR) ; patch < $(PORTDIR)/some.patch
	$(TOUCH) prep

#
# Configure and build
#
build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	#env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) $(NLS) ; $(make)
	#cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)"
	$(TOUCH) build

#
# Install in a self-contained directory root
#
install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local install
        #$(PYTHON) setup.py install \
		--no-compile \
                --home=$(INSTALLDIR)/usr/local \
                --install-lib=$(INSTALLDIR)/$(SITEPACKAGES)
	#$(PYTHON) -m compileall -d / $(INSTALLDIR)

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

	#$(STRIP) $(INSTALLDIR)/usr/local/bin/*
	#$(STRIP) $(INSTALLDIR)/usr/local/sbin/*
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	#$(STRIP_LIB) $(INSTALLDIR)/$(SITEPACKAGES)/*/*.so
	$(TOUCH) install

test: install
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	#$(test-universal-binary) "$(INSTALLDIR)/$(SITEPACKAGES)/*/*.so"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
