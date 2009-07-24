# $Id: Makefile,v 1.2 2009/03/06 19:15:42 ruda Exp $

# SMTP plugin for MUAs
# http://msmtp.sourceforge.net/
# GPL

NAME=		msmtp
VERSION=	1.4.17
REVISION=	0
URL=		$(SOURCEFORGE)msmtp
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
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)                                            
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,doc/msmtp*} $(INSTALLDOCDIR)  
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
