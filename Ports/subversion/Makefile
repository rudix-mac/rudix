# Subversion revision control system
# http://subversion.tigris.org/
# ?

include ../../Library/Rules.mk

TITLE=		Subversion $(VERSION)
NAME=		subversion
VERSION=	1.6.6
REVISION=	0
URL=		http://subversion.tigris.org/downloads/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS=	/usr/local/lib/libintl.la
endif
ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

#ifdef WITHOUT_NEON
#NEON=		--disable-neon
#else
#DEPENDS+=	/usr/local/lib/libneon.la
#endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
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
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/apache2/*.so"
	otool -L $(INSTALLDIR)/usr/local/lib/libsvn_ra_neon-1.dylib | grep -v '/usr/lib/libneon.26.dylib' > /dev/null
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
