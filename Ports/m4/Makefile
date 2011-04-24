# NOTE: GNU m4 doesn't requires gettext

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	GNU M4 is an implementation of the traditional Unix macro processor
Site=		http://www.gnu.org/software/m4/
License=	GPL
Title=		GNU M4
Name=		m4
Version=	1.4.16
Revision=	0
URL=		http://ftp.gnu.org/gnu/m4/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING


define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf m4 gm4
cd $(InstallDir)$(ManDir)/man1 ; ln -sf m4.1 gm4.1
endef
