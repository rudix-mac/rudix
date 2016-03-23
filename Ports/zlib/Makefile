include ../../Library/Configure.mk

Description=	zlib is a general purpose data compression library
Title=		Zlib
Name=		zlib
Version=	1.2.8
Revision=	0
Site=		http://www.zlib.net
Source=		http://zlib.net/$(Name)-$(Version).tar.gz
License=	zlib License

LicenseFile=	LICENSE

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif
