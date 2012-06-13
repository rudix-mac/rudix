include ../../Library/GNU.mk

Title=		Serf (Library)
Name=		serf
Version=	1.1.0
Revision=	0
URL=		http://serf.googlecode.com/files/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
