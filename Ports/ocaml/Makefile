include ../../Library/Rudix.mk

Title=		OCaml
Name=		ocaml
Version=	4.03.0
Site=		http://caml.inria.fr/
Source=		http://caml.inria.fr/pub/distrib/ocaml-4.03/$(Name)-$(Version).tar.xz
License=	QPLv1+LGPLv2

ReadMeFile=	$(SourceDir)/README.adoc
LicenseFile=	$(SourceDir)/LICENSE

# * The Makefiles do not support parallel make (e.g. make -j2).
# Fix: do not pass the -j option to make, and be patient.
define build_hook
cd $(SourceDir) ; ./configure ; $(MAKE) world.opt
endef

define install_hook
install -d $(InstallDir)/usr/local/bin
cd $(SourceDir) ; $(MAKE) \
		BINDIR=$(PortDir)/$(InstallDir)/usr/local/bin \
		LIBDIR=$(PortDir)/$(InstallDir)/usr/local/lib/ocaml \
		MANDIR=$(PortDir)/$(InstallDir)/usr/local/share/man install
cd $(SourceDir)/emacs ; make EMACSDIR=$(PortDir)/$(InstallDir)/usr/local/share/emacs/site-lisp
endef
