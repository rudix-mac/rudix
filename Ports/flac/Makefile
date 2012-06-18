include ../../Library/Config.mk
RUDIX_UNIVERSAL=
ArchFlags=-arch i386
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		FLAC
Name=		flac
Version=	1.2.1
Revision=	0
URL=		http://downloads.xiph.org/releases/flac/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

# collect2: ld terminated with signal 10 [Bus error]
GnuConfigureExtra += --disable-ogg
