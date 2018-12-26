include ../../Library/GNU.mk

Title=		FDK-AAC
Name=		fdk-aac
Version=	2.0.0
Site=		https://sourceforge.net/projects/opencore-amr
Source=		https://github.com/mstorsjo/fdk-aac/archive/v2.0.0.tar.gz
LicenseFile=	$(SourceDir)/NOTICE
ReadmeFile=	README

define prep_post_hook
cd $(BuildDir); ./autogen.sh
cp README $(BuildDir)
endef
