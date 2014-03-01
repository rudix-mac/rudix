include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre
Version=	8.34
Revision=	0
Site=		http://www.pcre.org/
#URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
URL=		http://downloads.sourceforge.net/pcre
Source=		$(Name)-$(Version).tar.bz2
Checksum=	e02257272c2c554b14bee723158d46da2b1ad72a
License=	BSD

LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-utf
GnuConfigureExtra += --enable-unicode-properties
GnuConfigureExtra += --enable-pcregrep-libz
GnuConfigureExtra += --enable-pcregrep-libbz2

define test_inner_hook
$(BinDir)/pcre-config --version | grep $(Version)
$(BinDir)/pcregrep Version Makefile
endef
