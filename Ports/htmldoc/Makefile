include ../../Library/GNU.mk

Name=		htmldoc
Version=	1.8.27
Revision=	13
URL=		http://ftp.easysw.com/pub/htmldoc/$(Version)/
Source=		$(Name)-$(Version)-source.tar.bz2

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += bindir=$(PortDir)/$(InstallDir)/$(BinDir)
MakeInstallExtra += mandir=$(PortDir)/$(InstallDir)/$(ManDir)
