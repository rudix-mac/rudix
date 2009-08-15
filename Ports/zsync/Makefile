# Client-side implementation of the rsync algorithm
# http://zsync.moria.org.uk/
# Artistic License

include ../../Library/Rules.mk

NAME=		zsync
VERSION=	0.6.1
REVISION=	0
URL=		http://zsync.moria.org.uk/download/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,NEWS,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 ppc7400 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
