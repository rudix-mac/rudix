# Summary for a GNU software
# http://homepage/
# GPL, LGPL

include ../../Library/Rules.mk

TITLE=		GNU Application $(VERSION)
NAME=		gnutemplate
VERSION=	1.2.3
REVISION=	0
URL=		http://path/to/download/
#URL=		http://downloads.sourceforge.net/template
#URL=		http://ftp.gnu.org/gnu/template
SOURCE=		$(NAME)-$(VERSION).tar.gz
#SOURCE=	$(NAME)-$(VERSION).tar.bz2
#SOURCE=	$(NAME)-$(VERSION).tar.Z
#SOURCE=	$(NAME)-$(VERSION).zip

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

#ifdef WITHOUT_NLS
#CONFIGURE_OPTS=	--disable-nls
#else
#DEPENDS+=	/usr/local/lib/libintl.dylib
#CONFIGURE_OPTS=	--enable-nls
#endif

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

prep: retrieve
	tar zxf $(SOURCE)
	#tar jxf $(SOURCE)
	#unzip $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/sbin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x $(INSTALLDIR)/usr/local/lib/lib*.a
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
