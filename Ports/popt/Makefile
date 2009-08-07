# getopt(3)-like library with a number of enhancements
# http://rpm5.org/
# BSD

include ../../Library/Rules.mk

TITLE=		Popt $(VERSION)
NAME=		popt
VERSION=	1.15
REVISION=	0
URL=		http://rpm5.org/files/popt/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef STATIC_ONLY
STATIC=		--enable-static --disable-shared
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		$(STATIC) $(NLS) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,README,popt.ps} $(INSTALLDOCDIR)
ifndef STATIC_ONLY
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
endif
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; ./testit.sh
ifndef STATIC_ONLY
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
endif
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test
