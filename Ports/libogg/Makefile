include ../../Library/GNU.mk

Title=		LibOgg
Name=		libogg
Version=	1.3.0
Revision=	0
URL=		http://downloads.xiph.org/releases/ogg/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
else
GnuConfigureExtra += --enable-static --enable-shared
endif
