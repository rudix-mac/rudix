include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Yasm
Name=		yasm
Version=	1.2.0
Revision=	0
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef
