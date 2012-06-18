BuildRequires += $(LibDir)/libogg.la # static-libogg

include ../../Library/GNU.mk

Title=		Libvorbis
Name=		libvorbis
Version=	1.3.3
Revision=	0
URL=		http://downloads.xiph.org/releases/vorbis/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
else
GnuConfigureExtra += --enable-static --enable-shared
endif
