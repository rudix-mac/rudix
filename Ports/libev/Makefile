include ../../Library/GNU.mk

Title=		Libev
Name=		libev
Version=	4.33
Site=		http://software.schmorp.de/pkg/libev
Source=		http://dist.schmorp.de/libev/$(Name)-$(Version).tar.gz
License=	BSD+GPLv2+

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
cp example.c $(BuildDir)
$(CC) -I$(IncludeDir) -L$(LibDir) -lev $(BuildDir)/example.c -o $(BuildDir)/example
$(BuildDir)/example
endef
