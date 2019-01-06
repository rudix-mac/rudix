include ../../Library/GNU.mk

Title=		GNU Sed
Name=		sed
Version=	4.7
Site=		https://www.gnu.org/software/sed
Source=		https://ftp.gnu.org/gnu/sed/$(Name)-$(Version).tar.xz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf gnused sed
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf gnused.1 sed.1
endef

define test_hook
$(BinDir)/sed --version | grep $(Version)
endef
