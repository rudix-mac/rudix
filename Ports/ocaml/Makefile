include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		OCaml
Name=		ocaml
Version=	3.12.1
Revision=	0
URL=		http://caml.inria.fr/pub/distrib/ocaml-3.12/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE


define build_inner_hook
cd $(SourceDir) ; ./configure ; $(MAKE) world ; $(MAKE) opt
endef

define install_inner_hook
cd $(SourceDir) ; $(MAKE) \
		BINDIR=$(INSTALLDIR)/usr/local/bin \
		LIBDIR=$(INSTALLDIR)/usr/local/lib/ocaml \
		MANDIR=$(INSTALLDIR)/usr/local/share/man install
cd $(SourceDir)/emacs ; make EMACSDIR=$(INSTALLDIR)/usr/local/share/emacs/site-lisp
endef
