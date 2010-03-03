# Makefile for a new port
# http://rudix.org/
# License (GPL, LGPL, BSD, Apache, etc.)

include ../../Library/Rules.mk

TITLE=		Template $(VERSION)
NAME=		template
VERSION=	1.2.3
REVISION=	0
URL=		http://path/to/download/
#URL=		http://downloads.sourceforge.net/$(NAME)
#URL=		http://ftp.gnu.org/gnu/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz
#SOURCE=	$(NAME)-$(VERSION).tar.bz2
#SOURCE=	$(NAME)-$(VERSION).tar.Z
#SOURCE=	$(NAME)-$(VERSION).zip

#ifdef WITHOUT_NLS
#CONFIGURE_OPTS=	--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.la
#CONFIGURE_OPTS=	--enable-nls
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
# Configure and build from sources
#
build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) ; $(make)
	#cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="($LDFLAGS)"
	$(TOUCH) build

#
# Install in a self-contained directory root
#
install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local install

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	#install -d $(INSTALLDOCDIR)
	#install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)

	#$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	#$(STRIP_BIN) $(INSTALLDIR)/usr/local/sbin/*
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/sbin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.dylib) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
