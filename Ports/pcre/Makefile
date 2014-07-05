include ../../Library/GNU.mk

Description=	Perl Compatible Regular Expressions library
Title=		PCRE
Name=		pcre
Version=	8.35
Revision=	0
Site=		http://www.pcre.org/
#URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
URL=		http://downloads.sourceforge.net/pcre
Source=		$(Name)-$(Version).tar.bz2
Checksum=	a10e0040475644bfc97f7d0c0556988acfc52c6f
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
