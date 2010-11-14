# Audio/video converter and streamer
# http://ffmpeg.mplayerhq.hu/
# GPL

NAME=		ffmpeg
VERSION=	snapshot
REVISION=	1.i386
URL=		http://ffmpeg.org/releases/
SOURCE=		ffmpeg-export-snapshot.tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	mv ffmpeg-export-????-??-?? ffmpeg-snapshot
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure \
		--cc="gcc-4.0" \
		--enable-gpl \
		--enable-shared \
		--enable-pthreads \
		--mandir=/usr/local/share/man ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/etc
	install -m 644 $(BUILDDIR)/doc/ffserver.conf $(INSTALLDIR)/usr/local/etc/ffserver.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING*,CREDITS,ChangeLog,MAINTAINERS,README,doc/TODO,doc/*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*
	touch install

test: install
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	#$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*"
	touch test
