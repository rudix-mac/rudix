include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre
Version=	8.40
Site=		http://www.pcre.org/
Source=		https://ftp.pcre.org/pub/pcre/pcre-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-jit
GnuConfigureExtra += --enable-utf
GnuConfigureExtra += --enable-unicode-properties
GnuConfigureExtra += --enable-pcregrep-libz
GnuConfigureExtra += --enable-pcregrep-libbz2
GnuConfigureExtra += --enable-pcretest-libedit

define test_hook
$(BinDir)/pcre-config --version | grep $(Version)
$(BinDir)/pcregrep $(Version) Makefile
endef
