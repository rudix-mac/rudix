# Requires xz package to uncompress .tar.gz

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU Core Utilities
Name=		coreutils
Version=	8.15
Revision=	0
URL=		http://ftp.gnu.org/gnu/coreutils/
Source=		$(Name)-$(Version).tar.xz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra +=  --program-prefix=gnu

define install_post_hook
$(PortDir)/mklinks.sh $(InstallDir)$(BinDir)
$(PortDir)/mklinks.sh $(InstallDir)$(Prefix)/share/man/man1
endef
