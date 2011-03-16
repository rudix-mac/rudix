# http://rudix.org/
# GPL, LGPL, BSD, Apache, etc.

include ../../Library/Rules.mk

DESCRIPTION=	Starting point for new ports.
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

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

#ifdef WITHOUT_NLS
#CONFIG_OPTS=	--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.la
#CONFIG_OPTS=	--enable-nls
#endif

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

#
# Preparing to build: extract source and apply patches
#
prep: retrieve
	tar zxf $(SOURCE)
	#tar jxf $(SOURCE)
	#unzip $(SOURCE)
	#patch -d $(BUILDDIR) < $(PORTDIR)/some.patch
	#for x in $(PORTDIR)/patches/* ; do \
	#	patch -d $(BUILDDIR) < $$x ; done
	touch prep

#
# Configure and build from sources
#
build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) ; $(make)
	#cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" LDFLAGS="($LDFLAGS)"
	touch build

#
# Install in a self-contained directory root
#
install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	#cd $(BUILDDIR) ; make prefix=$(INSTALLDIR)/usr/local install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/sbin/*
	strip -x $(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

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
	touch test
