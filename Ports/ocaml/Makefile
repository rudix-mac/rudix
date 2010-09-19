# ML language based on complete class-based objective system
# http://caml.inria.fr/
# LGPL

include ../../Library/Rules.mk

NAME=		ocaml
VERSION=	3.12.0
REVISION=	0.i386
URL=		http://caml.inria.fr/pub/distrib/ocaml-3.12/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure ; \
	$(make) world && $(make) bootstrap && $(make) opt && $(make) opt.opt
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make \
		BINDIR=$(INSTALLDIR)/usr/local/bin \
		LIBDIR=$(INSTALLDIR)/usr/local/lib/ocaml \
		MANDIR=$(INSTALLDIR)/usr/local/share/man install
	cd $(BUILDDIR)/emacs ; make EMACSDIR=$(INSTALLDIR)/usr/local/share/emacs/site-lisp
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{Changes,LICENSE,README,VERSION} $(INSTALLDOCDIR)
	#strip $(INSTALLDIR)/usr/local/bin/*
	#strip -x $(INSTALLDIR)/usr/local/lib/ocaml/*.so
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; $(TOUCH) test
