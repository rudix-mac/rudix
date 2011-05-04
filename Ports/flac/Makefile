include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://flac.sourceforge.net/
License=	BSD
Description=	FLAC - Free Lossless Audio Codec
Title=		FLAC
Name=		flac
Version=	1.2.1
Revision=	0
URL=		http://downloads.xiph.org/releases/flac/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LICENSE.txt

# Not yet compiled with odd due:
# collect2: ld terminated with signal 10 [Bus error]
GnuConfigureExtra += --disable-ogg
