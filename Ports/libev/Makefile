include ../../Library/GNU.mk

Description=	Full-featured and high-performance event loop that is loosely modelled after libevent
Title=		Libev
Name=		libev
Version=	4.20
Revision=	0
Site=		http://software.schmorp.de/pkg/libev.html
Source=		http://dist.schmorp.de/libev/$(Name)-$(Version).tar.gz
License=	BSD/GPL

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
cp example.c $(BuildDir)
$(CC) -I$(IncludeDir) -L$(LibDir) -lev $(BuildDir)/example.c -o $(BuildDir)/example
$(BuildDir)/example
endef
