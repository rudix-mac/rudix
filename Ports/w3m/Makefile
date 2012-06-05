include ../../Library/GNU.mk

Title=		w3m
Name=		w3m
Version=	0.5.3
Revision=	0
URL=		http://sourceforge.net/projects/w3m/files/w3m/w3m-$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/doc/README
LicenseFile=	$(SourceDir)/include/gc.h

GnuConfigureExtra += --enable-cplusplu

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
