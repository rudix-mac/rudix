include ../../Library/GNU.mk

Title=		AEWAN
Name=		aewan
Version=	1.0.01
Site=		https://sourceforge.net/projects/aewan/
Source=		https://sourceforge.net/projects/aewan/files/aewan/$(Name)-$(Version)/$(Name)-$(Version).tar.gz/download
License=	GPLv2

ReadMeFile=	$(SourceDir)/README

#define after_prep_hook
#patch -p1 -d $(SourceDir) < patches/01-mouse.diff
#endef

#define uncompress_source
#tar -xvf aewan-$(Version).tar.gz || true
#endef

PatchLevel = -p1
