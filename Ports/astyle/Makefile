include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Site=		http://astyle.sourceforge.net/
License=	LGPL
Description=	Indenter and formatter of C/C++/Java source files
Title=		Artistic Style
Name=		astyle
Version=	2.02
Revision=	1
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)_$(Version)_macosx.tar.gz

ReadMeFile=	$(SourceDir)/doc/index.html
LicenseFile=	$(SourceDir)/doc/license.html

UncompressedName=$(Name)
BuildDir=	$(SourceDir)/build/mac

GnuMakeInstallExtra += prefix=$(InstallDir)${Prefix}
GnuMakeInstallExtra += INSTALL=install

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(InstallDir)/$(DocDir)/$(Name)
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/astyle $(InstallDir)/$(BinDir)
endef
