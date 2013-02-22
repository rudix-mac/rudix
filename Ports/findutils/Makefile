include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU Find Utilities
Name=		findutils
Version=	4.4.2
Revision=	4
URL=		http://ftp.gnu.org/gnu/findutils/
Source=		$(Name)-$(Version).tar.gz


ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += --program-prefix=gnu
GnuConfigureExtra += --with-included-regex

define install_post_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
./links.sh $(InstallDir)$(Prefix)/share/man/man5
cd $(InstallDir)$(Prefix)/share/info ; ln -sf find.info gnufind.info
endef
