include ../../Library/Configure.mk

Title=		Zlib
Name=		zlib
Version=	1.2.11
Site=		http://www.zlib.net
Source=		http://zlib.net/$(Name)-$(Version).tar.gz
License=	zlib License

LicenseFile=	LICENSE

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif
