include ../../Library/GNU.mk

Title=		PCRE
Name=		pcre2
Version=	10.32
Site=		https://www.pcre.org
Source=		https://ftp.pcre.org/pub/pcre/$(Name)-$(Version).tar.bz2
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
