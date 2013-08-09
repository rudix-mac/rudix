include ../../Library/GNU.mk

Title=		HTMLDOC
Name=		htmldoc
Version=	1.8.27
Revision=	14
#URL=		http://ftp.easysw.com/pub/htmldoc/$(Version)/
URL=		http://www.msweet.org/files/project1/
Source=		$(Name)-$(Version)-source.tar.bz2

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += bindir=$(PortDir)/$(InstallDir)/$(BinDir)
MakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/$(ManDir)

define test_inner_hook
$(BinDir)/htmldoc --version
endef
