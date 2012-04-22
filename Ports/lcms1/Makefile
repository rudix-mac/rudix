BuildRequires += $(LibDir)/libjpeg.la

include ../../Library/GNU.mk

Title=		Little CMS (Version 1)
Name=		lcms1
Version=	1.19
Revision=	0
URL=		http://sourceforge.net/projects/lcms/files/lcms/$(Version)/
Source=		lcms-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.1st
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = lcms-$(Version)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
