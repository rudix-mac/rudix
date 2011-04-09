include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://www.cabextract.org.uk/
License=	GPL
Description=	Extracts files from Microsoft CAB archives
Title=		cabextract
Name=		cabextract
Version=	1.3
Revision=	1
URL=		http://www.cabextract.org.uk/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
install -m 755 $(SourceDir)/src/cabinfo $(InstallDir)$(BinDir)
install -m 644 $(SourceDir)/doc/{magic,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef