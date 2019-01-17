include ../../Library/Unix.mk

Title=		Artistic Style
Name=		astyle
Version=	2.06
Site=		http://astyle.sourceforge.net
Source=		https://sourceforge.net/projects/astyle/files/astyle/$(Name)%20$(Version)/$(Name)_$(Version)_macosx.tar.gz
License=	LGPL

ReadMeFile=	$(SourceDir)/doc/index.html
LicenseFile=	$(SourceDir)/doc/license.html

UncompressedName = $(Name)
BuildDir=	$(SourceDir)/build/mac

MakeInstallExtra += prefix=$(InstallDir)$(Prefix)
MakeInstallExtra += INSTALL=install

define after_install_hook
install -m 644 $(SourceDir)/doc/* $(InstallDir)/$(DocDir)/$(Name)
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/astyle $(InstallDir)/$(BinDir)
endef

define test_hook
endef

define test_hook
$(BinDir)/astyle  --version
endef
