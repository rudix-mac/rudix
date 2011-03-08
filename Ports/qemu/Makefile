# multi system emulator
# http://wiki.qemu.org/
# GPL

include ../../Library/Rules.mk

TITLE=		QEMU $(VERSION)
NAME=		qemu
VERSION=	0.14.0
REVISION=	0
URL=		http://download.savannah.gnu.org/releases/qemu/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/qemu-doc.html
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	./configure \
		--enable-cocoa \
		--disable-bsd-user \
		--disable-darwin-user ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
