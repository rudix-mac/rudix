include ../../Library/Config.mk
RUDIX_UNIVERSAL=
include ../../Library/Rudix.mk

Title=		P7ZIP
Name=		p7zip
Version=	9.20.1
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
URL=		http://sourceforge.net/projects/p7zip/files/p7zip/$(Version)/
Source=		$(Name)_$(Version)_src_all.tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/DOCS/License.txt

UncompressedName = $(Name)_$(Version)

MakeExtra += all3

define build_inner_hook
cd $(BuildDir) ; $(make) $(MakeExtra)
endef

define install_inner_hook
cd $(BuildDir) ; $(make) \
	DEST_HOME="$(PortDir)/$(InstallDir)/$(Prefix)" \
	DEST_MAN="$(PortDir)/$(InstallDir)/$(ManDir)" $(MakeInstallExtra) install
$(install_base_documentation)
rm -f $(InstallDir)/$(BinDir)/*
chmod -R u+w $(InstallDir)
ln -s ../lib/p7zip/7z $(InstallDir)/$(BinDir)/7z
ln -s ../lib/p7zip/7za $(InstallDir)/$(BinDir)/7za
ln -s ../lib/p7zip/7zr $(InstallDir)/$(BinDir)/7zr
endef

define test_inner_hook
cd $(BuildDir) ; $(make) test
endef

define test_inner_hook
/usr/local/bin/7z
/usr/local/bin/7za
/usr/local/bin/7zr
endef
