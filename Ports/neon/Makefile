include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.31.2
Site=		https://notroj.github.io/neon/
Source=		https://notroj.github.io/neon/neon-$(Version).tar.gz
License=	LGPLv2+
LicenseFile=	$(SourceDir)/src/COPYING.LIB
ReadMeFile=	$(SourceDir)/README.md

BuildRequires += $(BinDir)/pkg-config	# pkg-config
BuildRequires += $(LibDir)/libssl.la	# static-libressl | openssl
GnuConfigureExtra += --with-ssl=openssl

define test_hook
$(BinDir)/neon-config --version | grep $(Version)
endef
