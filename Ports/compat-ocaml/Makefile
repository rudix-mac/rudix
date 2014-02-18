include ../../Library/Rudix.mk

Title=		OCaml
Name=		compat-ocaml
Version=	3.12.1
Revision=	0
URL=		http://caml.inria.fr/pub/distrib/ocaml-3.12/
Source=		ocaml-$(Version).tar.bz2
UncompressedName=ocaml-$(Version)

LicenseFile=	$(SourceDir)/LICENSE

# * The Makefiles do not support parallel make (e.g. make -j2).
# Fix: do not pass the -j option to make, and be patient.
define build_inner_hook
cd $(SourceDir) ; ./configure ; $(MAKE) world.opt
endef

define install_inner_hook
install -d $(InstallDir)/usr/local/bin
cd $(SourceDir) ; $(MAKE) \
		BINDIR=$(PortDir)/$(InstallDir)/usr/local/bin \
		LIBDIR=$(PortDir)/$(InstallDir)/usr/local/lib/ocaml \
		MANDIR=$(PortDir)/$(InstallDir)/usr/local/share/man install
cd $(SourceDir)/emacs ; make EMACSDIR=$(PortDir)/$(InstallDir)/usr/local/share/emacs/site-lisp
endef
