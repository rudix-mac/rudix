include ../../Library/GNU.mk

Title=		FDK-AAC
Name=		fdk-aac
Version=	2.0.0
Site=		https://sourceforge.net/projects/opencore-amr
Source=		https://github.com/mstorsjo/fdk-aac/archive/v2.0.0.tar.gz
License=    GPL
LicenseFile=	$(SourceDir)/NOTICE
ReadmeFile=	$(BuildDir)/README

define prep_post_hook
cd $(BuildDir); ./autogen.sh
echo "Library of OpenCORE Framework implementation of Adaptive Multi Rate Narrowband and Wideband (AMR-NB and AMR-WB) speech codec. Library of VisualOn implementation of Adaptive Multi Rate Wideband (AMR-WB) encoder and Advanced Audio Coding (AAC) encoder. Modified library of Fraunhofer AAC decoder and encoder." > $(BuildDir)/README
endef
