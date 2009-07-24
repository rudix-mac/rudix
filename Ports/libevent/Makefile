# $Id: Makefile,v 1.3 2009/07/22 02:46:10 ruda Exp $

include ../../Library/Rules.mk

# An event notification library
# http://monkey.org/~provos/libevent/
# BSD

TITLE=		libevent $(VERSION)
NAME=		libevent
VERSION=	1.4.11
REVISION=	0
URL=		http://monkey.org/~provos/
SOURCE=		$(NAME)-$(VERSION)-stable.tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	mv $(NAME)-$(VERSION)-stable $(NAME)-$(VERSION)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{ChangeLog,README} $(INSTALLDOCDIR)
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.dylib"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	cd $(BUILDDIR) ; make verify
	$(TOUCH) test
