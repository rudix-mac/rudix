include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	27.1
Site=		$(GnuHome)/$(Name)
Source=		https://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-$(Version).tar.gz
License=	GPLv3
BuildRequires += /usr/local/lib/pkgconfig/gnutls.pc
BuildRequires += /usr/local/lib/pkgconfig/libxml-2.0.pc

GnuConfigureExtra += --with-x=no
GnuConfigureExtra += --with-ns=no
GnuConfigureExtra += --with-modules

define after_install_hook
rm -rf $(InstallDir)$(LocalStateDir)
endef

define test_hook
$(BinDir)/emacs --version | grep $(Version)
endef
