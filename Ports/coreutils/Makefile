# GNU core utilities
# http://www.gnu.org/software/coreutils/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Core Utilities $(VERSION)
NAME=		coreutils
VERSION=	8.5
REVISION=	0
URL=		http://ftp.gnu.org/gnu/coreutils/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
CONFIGURE_OPTS=		--disable-nls
else
CONFIGURE_OPTS=		--enable-nls
DEPENDS+=		/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) \
		jm_cv_func_svid_putenv=yes \
		--disable-dependency-tracking \
		--program-prefix=gnu ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	$(PORTDIR)/mklinks.sh $(INSTALLDIR)/usr/local/bin
	$(PORTDIR)/mklinks.sh $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/gnu*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
