include ../../Library/Config.mk
RUDIX_UNIVERSAL=no # Due configure: error: ACC conformance test failed. Stop
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		LZO
Name=		lzo
Version=	2.06
Revision=	1
URL=		http://www.oberhumer.com/opensource/lzo/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-shared
