include ../../Library/Config.mk
# Compile without gettext
#RUDIX_ENABLE_NLS=no
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Dialog
Name=		dialog
Version=	1.1
AltVersion=	20120215
Revision=	2
URL=		ftp://invisible-island.net/dialog/
Source=		$(Name)-$(Version)-$(AltVersion).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = $(Name)-$(Version)-$(AltVersion)

define install_post_hook
install -m 644 $(SourceDir)/samples/*.rc $(InstallDir)/$(DocDir)/$(Name)
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif