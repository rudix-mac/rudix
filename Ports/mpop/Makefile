# $Id: Makefile,v 1.2 2009/03/06 18:40:22 ruda Exp $

# Small, fast and portable POP3 client
# http://mpop.sourceforge.net/
# GPL

NAME=		mpop
VERSION=	1.0.16
REVISION=	0
URL=		$(SOURCEFORGE)mpop
SOURCE=		$(NAME)-$(VERSION).tar.bz2

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.dylib
endif

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)                                            
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,doc/mpop*} $(INSTALLDOCDIR)  
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
