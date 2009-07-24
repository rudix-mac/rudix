# ANSI Common Lisp compiler
# http://clisp.cons.org/
# GPL

NAME=		clisp
VERSION=	2.47
REVISION=	0intel
URL=		$(SOURCEFORGE)clisp
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

DEPENDS=	/usr/local/lib/libreadline.dylib
DEPENDS+=	/usr/local/lib/libintl.dylib
DEPENDS+=	/usr/local/lib/libsigsegv.dylib
DEPENDS+=	/usr/local/lib/libavcall.a

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure ; $(make) -C src
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make -C src DESTDIR=$(INSTALLDIR) install
	rm -rf $(INSTALLDIR)/usr/local/bin/clisp.dSYM
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make -C src check
	$(TOUCH) test
