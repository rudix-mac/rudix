include ../../Library/GNU.mk

Title=		PNG
Name=		libpng
Version=	1.5.9
Revision=	0
URL=		http://prdownloads.sourceforge.net/libpng/
URL=		http://sourceforge.net/projects/libpng/files/libpng15/$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

static: buildclean installclean
	make pkg ONLY_STATIC_LIBS=1 RUDIX_APPLY_RECOMMENDATIONS=no DistName=static-$(Name)
	touch static
