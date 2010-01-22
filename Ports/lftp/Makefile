# Shell-like command line ftp and sftp client
# http://lftp.yar.ru/
# GPL

# FIXME: can't compile with /usr/lib/libreadline.dylib present

include ../../Library/Rules.mk

TITLE=		LFTP $(VERSION)
NAME=		lftp
VERSION=	4.0.5
REVISION=	0
URL=		http://ftp.yars.free.net/pub/source/lftp
SOURCE=		$(NAME)-$(VERSION).tar.bz2

DEPENDS=	/usr/local/lib/libreadline.a

ifdef WITHOUT_NLS
CONFIG_OPTS=	--disable-nls
else
CONFIG_OPTS=	--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv /usr/local/lib/libintl.a
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--with-modules \
		--with-openssl $(CONFIG_OPTS) ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/lftp.conf $(INSTALLDIR)/usr/local/etc/lftp.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FAQ,FEATURES,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(TOUCH) install

test: install
	$(TOUCH) test
