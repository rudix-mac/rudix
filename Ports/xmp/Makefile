include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://xmp.sourceforge.net/
License=	GPL
Description=	Extended module player

Title=		XMP $(VERSION)
Name=		xmp
Version=	3.3.0
Revision=	0
URL=		http://downloads.sourceforge.net/xmp
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/docs/COPYING

define install_post_hook
rm -rf $(InstallDir)/etc
endef
