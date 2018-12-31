include ../../Library/GNU.mk

Title=		AEWAN
Name=		aewan
Version=	1.0.01
Site=		https://sourceforge.net/projects/aewan/
Source=		https://sourceforge.net/projects/aewan/files/aewan/$(Name)-$(Version)/$(Name)-$(Version).tar.gz/download
License=	GPLv2

ReadMeFile=	$(SourceDir)/README

define retrieve_hook
wget --no-check-certificate -O aewan-1.0.01.tar.gz https://sourceforge.net/projects/aewan/files/aewan/aewan-1.0.01/aewan-1.0.01.tar.gz/download
endef

define uncompress_source
tar -xvf aewan-$(Version).tar.gz || true
endef

PatchLevel = -p1
