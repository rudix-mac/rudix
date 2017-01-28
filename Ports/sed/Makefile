include ../../Library/GNU.mk

Title=		GNU Sed
Name=		sed
Version=	4.2.2
Site=		http://www.gnu.org/software/sed/
Source=		http://ftp.gnu.org/gnu/sed//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf gnused sed
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf gnused.1 sed.1
endef

define test_inner_hook
$(BinDir)/sed --version | grep $(Version)
endef
