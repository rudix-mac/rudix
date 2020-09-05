include ../../Library/Unix.mk

Title=		genromfs
Name=		genromfs
Version=	0.5.7
Site=		https://github.com/chexum/genromfs
Source=		https://github.com/chexum/genromfs/archive/$(Version).tar.gz
License=	GPL
Description=	The mkfs equivalent for romfs filesystem

ReadMeFile=     $(SourceDir)/NEWS
LicenseFile=    $(SourceDir)/COPYING

define build_hook
make -C $(BuildDir) $(Name)
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -d $(DestDir)$(ManDir)/man8
install -m 755 $(BuildDir)/$(Name) $(DestDir)$(BinDir)/$(Name)
install -m 644 $(BuildDir)/$(Name).8 $(DestDir)$(ManDir)/man8
$(install_base_documentation)
endef
