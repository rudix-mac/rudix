include ../../Library/GNU.mk

Title=		GNU Find Utilities
Name=		findutils
Version=	4.6.0
Site=		http://www.gnu.org/software/findutils/
Source=		http://ftp.gnu.org/gnu/findutils/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --program-prefix=gnu
GnuConfigureExtra += --with-included-regex

define after_install_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
./links.sh $(InstallDir)$(Prefix)/share/man/man5
cd $(InstallDir)$(Prefix)/share/info ; ln -sf find.info gnufind.info
endef
