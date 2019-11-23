include ../../Library/CMake.mk

Title=		poppler
Name=		poppler
Version=	0.72.0
Site=		https://poppler.freedesktop.org
Source=		https://poppler.freedesktop.org/${Name}-${Version}.tar.xz
License=    GPL

define build_hook
mkdir -p $(BuildDir)/build
cd $(BuildDir)/build; \
pwd ;\
cmake .. -DCMAKE_BUILD_TYPE=Release \
	-DWITH_JPEG=ON -DBUILD_JPEG=OFF \
	-DJPEG_INCLUDE_DIR=/usr/local/include/ -DJPEG_LIBRARY=/usr/local/lib/libjpeg.dylib \
	-DWITH_TIFF=ON -DBUILD_TIFF=OFF \
	-DTIFF_INCLUDE_DIR=/usr/local/include/ -DTIFF_LIBRARY="/usr/local/lib/libtiff.dylib" \
;\
make
endef

define install_hook
make DESTDIR=`pwd`/$(InstallDir) -C $(BuildDir)/build install
endef

BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libjpeg.a # rudix libjpeg
BuildRequires += $(LibDir)/libtiffxx.a # rudix libtiff
BuildRequires += $(LibDir)/libopenjp2.a # libopenjpeg2
