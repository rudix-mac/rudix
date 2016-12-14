include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	25.1
Revision=	0
Site=		https://www.gnu.org/software/emacs/
Source=		https://ftp.gnu.org/gnu/emacs/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --without-x
GnuConfigureExtra += --without-ns

define install_post_hook
rm -rf $(InstallDir)$(LocalStateDir)
endef

define test_inner_hook
$(BinDir)/emacs --version | grep $(Version)
endef
