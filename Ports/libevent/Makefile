include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Libevent
Name=		libevent
Version=	2.0.17
Revision=	0
URL=		http://github.com/downloads/libevent/libevent/
Source=		$(Name)-$(Version)-stable.tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = $(Name)-$(Version)-stable

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
