include ../../Library/GNU.mk

BuildRequires += $(BinDir)/pkg-config		# pkg-config
BuildRequires += $(LibDir)/libunistring.la	# static-libunistring
BuildRequires += $(LibDir)/libidn2.la		# static-libidn2

Title=		Libpsl
Name=		libpsl
Version=	0.21.1
Site=		https://github.com/rockdaboot/libpsl
Source=		https://github.com/rockdaboot/libpsl/releases/download/$(Version)/libpsl-$(Version).tar.gz
License=        MIT
ReadMeFile=	README.md

define test_hook
$(BinDir)/psl --version | grep $(Version)
endef
