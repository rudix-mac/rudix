include ../../Library/GNU.mk

Title=		GNU Sed
Name=		sed
Version=	4.7
Site=		https://www.gnu.org/software/sed
Source=		https://ftp.gnu.org/gnu/sed/$(Name)-$(Version).tar.xz
<<<<<<< HEAD
License=	GPL
=======
License=	GPLv3
>>>>>>> upstream/master

GnuConfigureExtra += --program-prefix=gnu

define after_install_hook
cd $(InstallDir)$(BinDir) ; ln -sf gnused sed
cd $(InstallDir)$(ManDir)/man1 ; ln -sf gnused.1 sed.1
endef

define test_hook
$(BinDir)/sed --version | grep $(Version)
endef
