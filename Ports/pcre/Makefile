include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre
Version=	8.30
Revision=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-utf8

define test_post_hook
cd $(SourceDir) ; ./RunTest
endef

define test_inner_hook
/usr/local/bin/pcre-config --version
/usr/local/bin/pcregrep Version Makefile
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
