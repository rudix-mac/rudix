# $Id: Makefile,v 1.2 2009/03/27 01:59:54 ruda Exp $

# Object oriented script language with threads
# http://www.ruby-lang.org/

NAME=		ruby
VERSION=	1.9.1-p0
REVISION=	0
URL=		http://ftp.ruby-lang.org/pub/ruby/1.9/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

include ../../Library/Rules.mk

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) \
		--enable-ipv6 \
		--enable-pthread \
		--enable-shared \
		--with-readline-dir=/usr/local ; $(make) EXTLDFLAGS="$(LDFLAGS)"
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	./links.sh $(INSTALLDIR)/usr/local/bin $(VERSION)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.dylib
	strip -x -S $(INSTALLDIR)/usr/local/lib/*.a
	strip -x -S $(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*.bundle
	strip -x -S $(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*/*.bundle
	strip -x -S $(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*/*/*.bundle
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make test
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/*.a"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*.bundle"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*/*.bundle"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/ruby/1.9.1/*/*/*/*.bundle"
	$(TOUCH) test
