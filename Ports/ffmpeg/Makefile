# $Id: Makefile,v 1.2 2009/03/27 01:54:28 ruda Exp $

# Audio/video converter and streamer
# http://ffmpeg.mplayerhq.hu/

NAME=		ffmpeg
VERSION=	0.5
REVISION=	0intel
URL=		http://ffmpeg.org/releases/
SOURCE=		ffmpeg-$(VERSION).tar.bz2

include ../../Library/Rules.mk

#DEPENDS=	$(RECEIPTS)/lame.pkg
#DEPENDS+=	$(RECEIPTS)/SDL.pkg

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS_INTEL)" ./configure \
		--enable-gpl \
		--enable-shared \
		--enable-pthreads \
		--mandir=/usr/share/man ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/etc
	install -m 644 $(BUILDDIR)/doc/ffserver.conf $(INSTALLDIR)/usr/local/etc/ffserver.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING*,CREDITS,ChangeLog,MAINTAINERS,README,doc/TODO,doc/*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*
	$(TOUCH) install

test: install
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*"
	$(TOUCH) test
