include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Dtach
Name=		dtach
Version=	0.8
Revision=	8
URL=		http://downloads.sourceforge.net/dtach
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_inner_hook
$(install_base_documentation)
$(install_gnu_documentation)
install -d $(InstallDir)$(BinDir)
install -m 755 $(SourceDir)/dtach $(InstallDir)$(BinDir)
install -d $(InstallDir)$(Prefix)/share/man/man1
install -m 644 $(SourceDir)/dtach.1 $(InstallDir)$(Prefix)/share/man/man1
endef
