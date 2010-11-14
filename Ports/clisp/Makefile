# ANSI Common Lisp compiler
# http://clisp.cons.org/
# GPL

include ../../Library/Rules.mk

TITLE=		CLISP $(VERSION)
NAME=		clisp
VERSION=	2.48
REVISION=	0.i386
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif
#DEPENDS=	/usr/local/lib/libreadline.la
DEPENDS+=	/usr/local/lib/libintl.la
DEPENDS+=	/usr/local/lib/libsigsegv.la
DEPENDS+=	/usr/local/lib/libavcall.a

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure ; $(make) -C src
	touch build

install: build
	cd $(BUILDDIR) ; make -C src DESTDIR=$(INSTALLDIR) install
	rm -rf $(INSTALLDIR)/usr/local/bin/clisp.dSYM
	touch install

test: install
	cd $(BUILDDIR) ; make -C src check
	touch test
