include ../../Library/GNU.mk

Title=		Pixman
Name=		pixman
Version=	0.24.4
Revision=	1
URL=		http://www.cairographics.org/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra+=--enable-static --disable-shared
else
GnuConfigureExtra+=--enable-static --enable-shared
endif
