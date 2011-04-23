ifeq ($(RUDIX_ENABLE_NLS),yes)
BuildRequires += /usr/local/lib/libintl.la
endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU versions of grep pattern matching utilities
Site=		http://www.gnu.org/software/grep/
License=	GPL
Title=		GNU Grep
Name=		grep
Version=	2.7
Revision=	0
URL=		http://ftp.gnu.org/gnu/grep/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += --program-prefix=gnu

define install_post_hook
./links.sh $(InstallDir)$(BinDir)
./links.sh $(InstallDir)$(Prefix)/share/man/man1
cd $(InstallDir)$(Prefix)/share/info ; ln -sf grep.info gnugrep.info
endef
