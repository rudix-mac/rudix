# Text mode  World Wide Web (WWW) client
# http://lynx.isc.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Lynx $(VERSION)
NAME=		lynx
VERSION=	2.8.7
REVISION=	1
URL=		http://lynx.isc.org/release/
SOURCE=		$(NAME)$(VERSION).tar.bz2

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar jxvf $(SOURCE)
	mv lynx2-8-7 $(NAME)-$(VERSION)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/lynx.cfg.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(STATIC) \
		--enable-ipv6 \
		--with-ssl $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/lynx.cfg $(INSTALLDIR)/usr/local/etc/lynx.cfg.default
	mv $(INSTALLDIR)/usr/local/etc/lynx.lss $(INSTALLDIR)/usr/local/etc/lynx.lss.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CHANGES,COPYHEADER*,COPYING*,PROBLEMS,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
