include ../../Library/CMake.mk

Title=		poppler
Name=		poppler
Version=	0.72.0
Site=		https://poppler.freedesktop.org
Source=		https://poppler.freedesktop.org/${Name}-${Version}.tar.xz
License=    GPL

#
# Use rudix compiled libjpeg
#
CMakeExtra += -DWITH_JPEG=ON
CMakeExtra += -DJPEG_INCLUDE_DIR=/usr/local/include/
CMakeExtra += -DJPEG_LIBRARY=/usr/local/lib/libjpeg.dylib
#
# Use rudix compiled libtiff
#
CMakeExtra += -DWITH_TIFF=ON
CMakeExtra += -DTIFF_INCLUDE_DIR=/usr/local/include/
CMakeExtra += -DTIFF_LIBRARY=/usr/local/lib/libtiff.dylib

BuildRequires += $(LibDir)/libintl.a
BuildRequires += $(LibDir)/libjpeg.dylib
BuildRequires += $(LibDir)/libtiff.dylib
BuildRequires += $(LibDir)/libopenjp2.a
