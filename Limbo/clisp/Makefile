include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	ANSI Common Lisp compiler
Site=		http://www.clisp.org/
License=	GPL
Title=		CLISP
Name=		clisp
Version=	2.48
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

#FIXME:
#DEPENDS=	$(LibDir)/libreadline.la
#DEPENDS+=	$(LibDir)/libintl.la
#DEPENDS+=	$(LibDir)/libsigsegv.la
#DEPENDS+=	$(LibDir)/libavcall.la

prep: retrieve
	tar zxvf $(Source)
	touch prep

# FIXME: can't use $(configure) - invalid argument --cache-file=...
build: prep $(DEPENDS)
	cd $(SourceDir) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	./configure --disable-dependency-tracking ; $(make) -C src
	touch build

install: build
	cd $(SourceDir) ; make -C src DESTDIR=$(InstallDir) install
	rm -rf $(InstallDir)$(BinDir)/clisp.dSYM
	touch install

test: install
	cd $(SourceDir) ; make -C src check
	touch test
