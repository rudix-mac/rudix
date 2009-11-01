# Small, fast and portable POP3 client
# http://mpop.sourceforge.net/
# GPL

include ../../Library/Rules.mk

TITLE=		mpop $(VERSION)
NAME=		mpop
VERSION=	1.0.19
REVISION=	0
URL=		http://downloads.sourceforge.net/mpop/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)                                            
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,doc/mpop*} $(INSTALLDOCDIR)  
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	$(TOUCH) test
