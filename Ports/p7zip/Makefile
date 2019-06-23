include ../../Library/Custom.mk

Title=		P7ZIP
Name=		p7zip
Version=	16.02
Site=		http://p7zip.sourceforge.net/
Site=		http://p7zip.sourceforge.net/
Source=		http://sourceforge.net/projects/p7zip/files/p7zip/$(Version)//$(Name)_$(Version)_src_all.tar.bz2
License=	LGPL

LicenseFile=	$(SourceDir)/DOC/License.txt

UncompressedName = $(Name)_$(Version)

MakeExtra += all3

define build_hook
cd $(BuildDir) ; $(make) $(MakeExtra)
endef

define install_hook
cd $(BuildDir) ; cp makefile.macosx_llvm_64bits makefile.machine
cd $(BuildDir) ; $(make) \
	DEST_HOME="$(PortDir)/$(InstallDir)/$(Prefix)" \
	DEST_MAN="$(PortDir)/$(InstallDir)/$(ManDir)" $(MakeInstallExtra) install
$(install_base_documentation)
rm -f $(InstallDir)/$(BinDir)/*
chmod -R u+w $(InstallDir)
ln -s ../lib/p7zip/7za $(InstallDir)/$(BinDir)/7z
ln -s ../lib/p7zip/7za $(InstallDir)/$(BinDir)/7za
ln -s ../lib/p7zip/7zr $(InstallDir)/$(BinDir)/7zr

endef

define test_hook
cd $(BuildDir) ; $(make) test
endef

define test_hook
/usr/local/bin/7z
/usr/local/bin/7za
/usr/local/bin/7zr
endef
