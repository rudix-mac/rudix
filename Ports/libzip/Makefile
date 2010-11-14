# C library for zip archives
# http://nih.at/libzip/
# 

include ../../Library/Rules.mk

NAME=		libzip
VERSION=	0.9
REVISION=	1
URL=		http://nih.at/libzip/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: build
	cd $(BUILDDIR) ; make check
	touch test
