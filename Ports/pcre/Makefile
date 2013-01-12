include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre
Version=	8.32
Revision=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-utf8

define test_inner_hook
$(BinDir)/pcre-config --version
$(BinDir)/pcregrep Version Makefile
endef
