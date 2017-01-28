include ../../Library/Unix.mk

Title=		unRAR
Name=		unrar
Version=	5.0.1
Site=		http://www.rarlab.com/
Source=		http://www.rarlab.com/rar//$(Name)src-$(Version).tar.gz
License=	Freeware

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	$(SourceDir)/license.txt

UncompressedName=$(Name)

MakeInstallExtra += DESTDIR=$(DestDir)$(Prefix)

define install_post_hook
install -m 644 $(SourceDir)/acknow.txt $(InstallDir)$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/unrar | grep 'UNRAR 5.0'
endef
