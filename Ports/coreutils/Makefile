ifeq ($(RUDIX_ENABLE_NLS),yes)
BuildRequires += /usr/local/lib/libintl.la
endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU Core Utilities
Name=		coreutils
Version=	8.13
Revision=	0
URL=		http://ftp.gnu.org/gnu/coreutils/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += jm_cv_func_svid_putenv=yes
GnuConfigureExtra +=  --program-prefix=gnu

define install_post_hook
$(PortDir)/mklinks.sh $(InstallDir)$(BinDir)
$(PortDir)/mklinks.sh $(InstallDir)$(Prefix)/share/man/man1
endef
