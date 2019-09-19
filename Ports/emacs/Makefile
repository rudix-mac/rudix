include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	26.3
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.xz
License=	GPLv3

BuildRequires += /usr/local/lib/pkgconfig/gnutls.pc
BuildRequires += /usr/local/lib/pkgconfig/libxml-2.0.pc

GnuConfigureExtra += --with-x=no
GnuConfigureExtra += --with-ns=no

define after_install_hook
rm -rf $(InstallDir)$(LocalStateDir)
endef

define test_hook
$(BinDir)/emacs --version | grep $(Version)
endef
