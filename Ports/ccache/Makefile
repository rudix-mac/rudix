# Compiler cache
# http://ccache.samba.org/
# GPL

include ../../Library/Rules.mk

TITLE=		Compiler Cache $(VERSION)
NAME=		ccache
VERSION=	2.4
REVISION=	18
URL=		http://samba.org/ftp/ccache/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; \
	patch < $(PORTDIR)/universal-binary-support.patch ; \
	patch < $(PORTDIR)/patch-util_c
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDIR)/usr/local/libexec/ccache
	cd $(INSTALLDIR)/usr/local/libexec/ccache ; \
	for x in c++ cc g++ gcc ; do \
		ln -sf /usr/local/bin/ccache $$x ; \
	done
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/web/*.html $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/ccache -verify_arch i386 x86_64
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
