# From Kernighan and Pike: High Order Calculator
# http://cm.bell-labs.com/cm/cs/upe/index.html

NAME=		hoc
VERSION=	1.1
REVISION=	5
URL=		http://netlib.bell-labs.com/~bwk/
SOURCE=		$(NAME).sh

include ../../Library/Rules.mk

prep: retrieve
	mkdir $(BUILDDIR)
	cd $(BUILDDIR) ; sh $(PORTDIR)/hoc.sh ; \
	patch < $(PORTDIR)/hoc-1.1-makefile.patch ; \
	patch < $(PORTDIR)/hoc.y.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/hoc -verify_arch i386 x86_64
	touch test
