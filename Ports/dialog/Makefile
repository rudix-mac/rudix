include ../../Library/Config.mk

# Compile without gettext
RUDIX_ENABLE_NLS=no

include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Dialog
Name=		dialog
Version=	1.1-20110707
Revision=	1
URL=		ftp://invisible-island.net/dialog/
Source=		$(Name)-$(Version).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
install -m 644 $(SourceDir)/samples/*.rc $(InstallDir)/$(DocDir)/$(Name)
endef
