ifeq ($(RUDIX_ENABLE_NLS),yes)
BuildRequires += /usr/local/lib/libintl.la
endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU Stream Editor
Site=		http://www.gnu.org/software/sed/
License=	GPL
Title=		GNU Sed $(Version)
Name=		sed
Version=	4.2.1
Revision=	1
URL=		http://ftp.gnu.org/gnu/sed/
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
cd $(InstallDir)$(BinDir) ; ln -sf gnused sed
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf gnused.1 sed.1
endef
