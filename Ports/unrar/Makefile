include ../../Library/Unix.mk

Title=		unRAR
Name=		unrar
Version=	5.6.8
Site=		http://www.rarlab.com/
Source=		http://www.rarlab.com/rar/$(Name)src-$(Version).tar.gz
License=	Freeware

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	$(SourceDir)/license.txt

PatchLevel = -p1
UncompressedName=$(Name)

MakeInstallExtra += DESTDIR=$(DestDir)
MakeInstallExtra += PREFIX=$(Prefix)
MakeInstallExtra += SO=dylib

define install_post_hook
install -m 644 $(SourceDir)/acknow.txt $(InstallDir)$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/unrar | grep 'UNRAR 5.6'
endef
