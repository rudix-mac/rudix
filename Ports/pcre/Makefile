include ../../Library/GNU.mk

Description=	Perl Compatible Regular Expressions library
Title=		PCRE
Name=		pcre
Version=	8.37
Site=		http://www.pcre.org/
#URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
Source=		http://downloads.sourceforge.net/pcre/$(Name)-$(Version).tar.bz2
Checksum=	4c629b3f582366fae4e8912f0d9fa3140347d6e7
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
