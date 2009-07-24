# $Id: Makefile,v 1.2 2009/03/26 00:23:07 ruda Exp $

# Shell-like command line ftp and sftp client
# http://lftp.yar.ru/
# GPL

NAME=		lftp
VERSION=	3.7.11
REVISION=	0
URL=		http://ftp.yars.free.net/pub/source/lftp/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.dylib
endif

retrieve:
	$(FETCH) $(URL)/$(SOURCE)
	$(FETCH) $(GNU)/gnu/readline/readline-4.3.tar.gz
	$(TOUCH) retrieve

prep: retrieve
	tar jxvf $(SOURCE)
	tar zxvf readline-4.3.tar.gz -C $(BUILDDIR)
	$(TOUCH) prep

build: prep $(DEPENDS)
	# Oh great lftp guys...
	cd $(BUILDDIR)/readline-4.3 ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--cache-file=$(PORTDIR)/config.cache.readline \
		--disable-shared ; $(make)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--with-openssl $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/lftp.conf $(INSTALLDIR)/usr/local/etc/lftp.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,FAQ,FEATURES,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	$(TOUCH) test

realdistclean: distclean
	rm -f retrieve $(SOURCE) readline-4.3.tar.gz
