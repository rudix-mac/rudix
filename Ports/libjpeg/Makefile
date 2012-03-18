include ../../Library/GNU.mk

Title=		LibJpeg
Name=		libjpeg
Version=	8d
Revision=	0
URL=		http://www.ijg.org/files/
Source=		jpegsrc.v$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/README

UncompressedName= jpeg-$(Version)

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

static: buildclean installclean
	make pkg ONLY_STATIC_LIBS=1 RUDIX_APPLY_RECOMMENDATIONS=no DistName=static-$(Name)
	touch static
