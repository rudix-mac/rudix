BuildRequires += $(BinDir)/fltk-config  # fltk

include ../../Library/GNU.mk

Title=		HTMLDOC
Name=		htmldoc
Version=	1.8.28
#URL=		http://ftp.easysw.com/pub/htmldoc/$(Version)/
Site=		http://www.htmldoc.org/
Source=		http://www.msweet.org/files/project1//$(Name)-$(Version)-source.tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

MakeInstallExtra += prefix=$(DestDir)$(Prefix)
MakeInstallExtra += bindir=$(DestDir)$(BinDir)
MakeInstallExtra += mandir=$(DestDir)$(ManDir)
MakeInstallExtra += datadir=$(DestDir)$(DataDir)

define test_hook
$(BinDir)/htmldoc --version | grep $(Version)
endef

define after_install_hook
install -m 755 $(BuildDir)/htmldoc/htmldoc.app/Contents/MacOS/htmldoc \
	$(DestDir)$(BinDir)/htmldoc
endef

define test_hook
$(BinDir)/htmldoc --version | grep $(Version)
endef
