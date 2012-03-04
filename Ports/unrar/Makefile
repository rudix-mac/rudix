include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		unRAR
Name=		unrar
Version=	4.1.4
Revision=	0
URL=		http://www.rarlab.com/rar/
Source=		$(Name)src-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	$(SourceDir)/license.txt

UncompressedName=$(Name)

define prep_post_hook
#install -m 644 $(PortDir)/makefile.macosx $(SourceDir)/Makefile
cp -v $(SourceDir)/makefile.unix $(SourceDir)/Makefile
endef

define install_post_hook
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/unrar $(InstallDir)/$(BinDir)
endef
