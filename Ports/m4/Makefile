# NOTE: GNU m4 doesn't requires gettext
include ../../Library/GNU.mk

Title=		GNU M4
Name=		m4
Version=	1.4.18
Site=		https://www.gnu.org/software/m4/
Source=		https://ftp.gnu.org/gnu/m4/$(Name)-$(Version).tar.bz2
License=	GPLv3

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf m4 gm4
cd $(InstallDir)$(ManDir)/man1 ; ln -sf m4.1 gm4.1
endef

define test_hook
$(BinDir)/m4 --version | grep $(Version)
endef
