# multi system emulator
# http://wiki.qemu.org/
# GPL

include ../../Library/Rules.mk

TITLE=		QEMU $(VERSION)
NAME=		qemu
VERSION=	0.12.2
REVISION=	0.i386
URL=		http://download.savannah.gnu.org/releases/qemu/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure --enable-cocoa ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
