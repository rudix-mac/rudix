include ../../Library/CMake.mk

Title=		libopenjpeg2
Name=		openjpeg
Version=	2.3.0
Site=		https://github.com/uclouvain/${Name}
Source=		https://github.com/uclouvain/${Name}/archive/v${Version}.tar.gz
License=    GPL
ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

#
# Use rudix compiled libtiff
#
CMakeExtra += -DTIFF_INCLUDE_DIR=/usr/local/include/
CMakeExtra += -DTIFF_LIBRARY=/usr/local/lib/libtiff.dylib
