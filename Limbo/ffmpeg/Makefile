# Audio/video converter and streamer
# http://ffmpeg.mplayerhq.hu/
# GPL

include ../../Library/Rules.mk

TITLE=		FFmpeg $(VERSION)
NAME=		ffmpeg
VERSION=	20110313
REVISION=	0
URL=		http://ffmpeg.org/releases/
SOURCE=		ffmpeg-snapshot.tar.bz2
DEPENDS=	/usr/local/bin/yasm
DEPENDS+=	/usr/local/lib/libmp3lame.la

README=		$(BUILDDIR)/doc/ffmpeg.html
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar jxvf $(SOURCE)
	mv ffmpeg ffmpeg-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure \
		--cc="gcc-4.0" \
		--enable-gpl \
		--enable-shared \
		--enable-pthreads \
		--enable-libmp3lame \
		--mandir=/usr/local/share/man ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/etc
	install -m 644 $(BUILDDIR)/doc/ffserver.conf $(INSTALLDIR)/usr/local/etc/ffserver.conf.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING*,CREDITS,ChangeLog,MAINTAINERS,README,doc/TODO,doc/*.txt} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/lib*
	touch install

test: install
ifdef WITH_STATIC_LAME
	nm $(INSTALLDIR)/usr/local/lib/libavcodec.dylib | grep lame_init
else
	otool -L $(INSTALLDIR)/usr/local/bin/ffmpeg | grep libmp3lame.0.dylib
endif
	touch test
