#BuildRequires += /usr/local/lib/libintl.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Yasm
Name=		yasm
Version=	1.1.0
Revision=	3
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(PortDir)/README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef
