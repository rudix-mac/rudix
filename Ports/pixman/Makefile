include ../../Library/GNU.mk

Title=		Pixman
Name=		pixman
Version=	0.24.4
Revision=	0
URL=		http://www.cairographics.org/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared
endif
