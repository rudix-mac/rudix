include ../../Library/Config.mk

# Compile without gettext
RUDIX_ENABLE_NLS=no

include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Display dialog boxes from shell scripts
Site=		http://invisible-island.net/dialog/dialog.html
License=	LGPL
Title=		Dialog
Name=		dialog
Version=	1.1-20110707
Revision=	0
URL=		ftp://invisible-island.net/dialog/
Source=		$(Name)-$(Version).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
install -m 644 $(SourceDir)/samples/*.rc $(InstallDir)/$(DocDir)/$(Name)
endef
