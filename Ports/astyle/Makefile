include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Site=		http://astyle.sourceforge.net/
License=	LGPL
Description=	Indenter and formatter of C/C++/Java source files
Title=		Artistic Style
Name=		astyle
Version=	2.01
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)_$(Version)_macosx.tar.gz

ReadMeFile=	$(SourceDir)/doc/index.html
LicenseFile=	$(SourceDir)/doc/license.html

UncompressedName=$(Name)
BuildDir=	$(SourceDir)/build/mac

define install_post_hook
install -m 644 $(SourceDir)/doc/* $(InstallDir)/$(DocDir)/$(Name)
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/astyle $(InstallDir)/$(BinDir)
endef
