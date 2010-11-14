# multi system emulator
# http://wiki.qemu.org/
# GPL

include ../../Library/Rules.mk

TITLE=		QEMU $(VERSION)
NAME=		qemu
VERSION=	0.13.0
REVISION=	0.i386
URL=		http://download.savannah.gnu.org/releases/qemu/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure --enable-cocoa ; make
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
