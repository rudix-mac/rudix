include ../../Library/GNU.mk

Description=	Perl Compatible Regular Expressions library
Title=		PCRE
Name=		pcre
Version=	8.36
Revision=	0
Site=		http://www.pcre.org/
#URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
Source=		http://downloads.sourceforge.net/pcre/$(Name)-$(Version).tar.bz2
Checksum=	9a074e9cbf3eb9f05213fd9ca5bc188644845ccc
License=	BSD

LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-jit
GnuConfigureExtra += --enable-utf
GnuConfigureExtra += --enable-unicode-properties
GnuConfigureExtra += --enable-pcregrep-libz
GnuConfigureExtra += --enable-pcregrep-libbz2
GnuConfigureExtra += --enable-pcretest-libedit

define test_inner_hook
$(BinDir)/pcre-config --version | grep $(Version)
$(BinDir)/pcregrep $(Version) Makefile
endef
