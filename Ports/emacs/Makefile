include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	26.1
Site=		https://www.gnu.org/software/emacs/
Source=		https://ftp.gnu.org/gnu/emacs/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --with-x=no
GnuConfigureExtra += --with-ns=no
GnuConfigureExtra += --with-gnutls=no

define after_install_hook
rm -rf $(InstallDir)$(LocalStateDir)
endef

define test_hook
$(BinDir)/emacs --version | grep $(Version)
endef
