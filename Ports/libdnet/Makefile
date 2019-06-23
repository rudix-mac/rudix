include ../../Library/GNU.mk

Title=		Dumb Networking Library
Name=		libdnet
Version=	1.12
Site=		https://github.com/dugsong/libdnet/
Source=		${Site}/archive/$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE
UncompressedName=libdnet-libdnet-1.12

define test_hook
$(BinDir)/dnet-config --version
endef
