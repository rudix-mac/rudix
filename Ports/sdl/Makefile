# Cross-platform multimedia library
# http://www.libsdl.org/
# LGPL

include ../../Library/Rules.mk

NAME=		SDL
VERSION=	1.2.14
REVISION=	0.i386
URL=		http://www.libsdl.org/release
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; $(configure) --enable-nasm ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,COPYING,CREDITS,README,README-SDL.txt,README.MacOSX} $(INSTALLDOCDIR)
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(TOUCH) test
