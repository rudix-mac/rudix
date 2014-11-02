include ../../Library/Configure.mk

Description=	zlib is a general purpose data compression library
Title=		Zlib
Name=		zlib
Version=	1.2.8
Revision=	0
Site=		http://www.zlib.net
URL=		http://zlib.net
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	LICENSE

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
ConfigureExtra += --static
endif
