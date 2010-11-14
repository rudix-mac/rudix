# Command-line WebDAV client
# http://www.webdav.org/cadaver/
# GPL

include ../../Library/Rules.mk

TITLE=		cadaver $(VERSION)
NAME=		cadaver
VERSION=	0.23.3
REVISION=	0
URL=		http://www.webdav.org/cadaver/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
CONFIGURE_OPTS=	--disable-nls --without-libintl-prefix
else
DEPENDS+=	/usr/local/lib/libintl.la
CONFIGURE-OPTS=	--enable-nls
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIGURE_OPTS) \
		--with-ssl ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; \
	make 	prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man  install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,COPYING,ChangeLog,FAQ,INTEROP,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
