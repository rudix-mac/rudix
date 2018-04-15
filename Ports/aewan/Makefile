include ../../Library/GNU.mk

Title=		AEWAN
Name=		aewan
Version=	1.0.01
Site=		https://sourceforge.net/projects/aewan/
Source=		https://sourceforge.net/projects/aewan/files/aewan/$(Name)-$(Version)/$(Name)-$(Version).tar.gz/download
License=	GPLv2

ReadMeFile=	$(SourceDir)/README

define prep_post_hook
patch -p1 -d $(SourceDir) < patches/01-mouse.diff
endef
