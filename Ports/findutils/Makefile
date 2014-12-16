include ../../Library/GNU.mk

Title=		GNU Find Utilities
Name=		findutils
Version=	4.4.2
Revision=	5
Site=		http://www.gnu.org/software/findutils/
URL=		http://ftp.gnu.org/gnu/findutils/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --program-prefix=gnu
GnuConfigureExtra += --with-included-regex

define install_post_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
./links.sh $(InstallDir)$(Prefix)/share/man/man5
cd $(InstallDir)$(Prefix)/share/info ; ln -sf find.info gnufind.info
endef
