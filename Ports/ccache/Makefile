# Compiler cache
# http://ccache.samba.org/
# GPL

include ../../Library/Rules.mk

TITLE=		ccache $(VERSION)
NAME=		ccache
VERSION=	3.0.1
REVISION=	0
URL=		http://samba.org/ftp/ccache/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
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
	install -m 644 $(BUILDDIR)/{COPYING,INSTALL.*,NEWS.*,README.*} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/ccache -verify_arch i386 x86_64
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
