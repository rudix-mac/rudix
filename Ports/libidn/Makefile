include ../../Library/GNU.mk

Title=		GNU Libidn
Name=		libidn
Version=	1.24
Revision=	1
URL=		http://ftp.gnu.org/gnu/libidn/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
