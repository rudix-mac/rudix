include ../../Library/Unix.mk

Title=		My Package
Name=		libpsl
Version=	0.20.2
Site=		https://github.com/rockdaboot/libpsl
Source=		https://github.com/rockdaboot/libpsl/archive/libpsl-0.20.2.tar.gz
License=        GPL

UncompressedName= libpsl-libpsl-0.20.2

LicenseFile=	$(BuildDir)/LICENSE
ReadMeFile=	$(BuildDir)/README

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
GnuConfigureExtra += --enable-static
endif

define build_pre_hook
cd $(BuildDir); ./autogen.sh; ./configure
-mkdir -p $(BuildDir)/list
curl --output $(BuildDir)/list/public_suffix_list.dat https://raw.githubusercontent.com/publicsuffix/list/master/public_suffix_list.dat
endef
