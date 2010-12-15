# ANSI Common Lisp compiler
# http://clisp.cons.org/
# GPL

include ../../Library/Rules.mk

TITLE=		CLISP $(VERSION)
NAME=		clisp
VERSION=	2.48
REVISION=	0
URL=		http://downloads.sourceforge.net/$(NAME)
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif
#DEPENDS=	/usr/local/lib/libreadline.la
DEPENDS+=	/usr/local/lib/libintl.la
DEPENDS+=	/usr/local/lib/libsigsegv.la
DEPENDS+=	/usr/local/lib/libavcall.la

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

# FIXME: can't use $(configure) - invalid argument --cache-file=...
build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	./configure --disable-dependency-tracking ; $(make) -C src
	touch build

install: build
	cd $(BUILDDIR) ; make -C src DESTDIR=$(INSTALLDIR) install
	rm -rf $(INSTALLDIR)/usr/local/bin/clisp.dSYM
	touch install

test: install
	cd $(BUILDDIR) ; make -C src check
	touch test
