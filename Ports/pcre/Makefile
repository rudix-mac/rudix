include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre
Version=	8.33
Revision=	0
#URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
URL=		http://downloads.sourceforge.net/pcre
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-utf
GnuConfigureExtra += --enable-unicode-properties
GnuConfigureExtra += --enable-pcregrep-libz
GnuConfigureExtra += --enable-pcregrep-libbz2

define test_inner_hook
$(BinDir)/pcre-config --version | grep $(Version)
$(BinDir)/pcregrep Version Makefile
endef
