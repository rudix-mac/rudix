# Wine
# http://wiki.winehq.org/
# ?

include ../../Library/Rules.mk

TITLE=		Wine $(VERSION)
NAME=		wine
VERSION=	1.1.36
REVISION=	0
URL=		http://ibiblio.org/pub/linux/system/emulators/wine/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) --disable-win16 ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ANNOUNCE,AUTHORS,COPYING.LIB,LICENSE,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
