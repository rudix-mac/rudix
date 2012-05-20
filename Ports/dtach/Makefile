include ../../Library/GNU.mk

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
install -d $(InstallDir)/$(BinDir)
install -m 775 $(SourceDir)/dtach $(InstallDir)/$(BinDir)
install -d $(InstallDir)/$(ManDir)/man1
install -m 664 $(SourceDir)/dtach.1 $(InstallDir)/$(ManDir)/man1
endef

define final_inner_hook
$(BinDir)/dtach --version
endef
