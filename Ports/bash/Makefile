include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://www.gnu.org/software/bash/
License=	GPL
Description=	GNU Bourne Again Shell
Title=		GNU Bash $(Version)
Name=		bash
Version=	4.1
Revision=	1
URL=		http://ftp.gnu.org/gnu/bash/
Source=		bash-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING


define install_post_hook
cd $(InstallDir)$(BinDir) ; ln -sf bash bash4
cd $(InstallDir)$(Prefix)/share/man/man1 ; ln -sf bash.1 bash4.1
install -m 644 $(SourceDir)/{COMPAT,POSIX,RBASH,Y2K} $(InstallDir)/$(DocDir)/$(Name)
endef
