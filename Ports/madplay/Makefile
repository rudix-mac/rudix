# Command-line MPEG audio decoder and player
# http://www.underbit.com/products/mad/
# GPL

include ../../Library/Rules.mk

TITLE=		MAD Player $(VERSION)
NAME=		madplay
VERSION=	0.15.2b
REVISION=	14.i386
URL=		ftp://ftp.mars.org/pub/mpeg/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libmad.la
DEPENDS+=	/usr/local/lib/libid3tag.la

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR) < $(PORTDIR)/madplay-0.15.2b-configure.patch ; \
	patch -d $(BUILDDIR) < $(PORTDIR)/madplay-0.15.2b-audio_carbon.c.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES,COPYING,COPYRIGHT,CREDITS,README,TODO} $(INSTALLDOCDIR)
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
