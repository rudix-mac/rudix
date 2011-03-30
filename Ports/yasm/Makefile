include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://www.tortall.net/projects/yasm/
License=	BSD
Description=	Complete rewrite of the NASM assembler
Title=		Yasm $(Version)
Name=		yasm
Version=	1.1.0
Revision=	2
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef
