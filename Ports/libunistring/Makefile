include ../../Library/GNU.mk

Title=		GNU libunistring
Name=		libunistring
Version=	0.9.3
Revision=	1
URL=		http://ftp.gnu.org/gnu/libunistring/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
