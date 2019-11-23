include ../../Library/CMake.mk

Title=		OpenJPEG
Name=		openjpeg
Version=	2.3.0
Site=		https://github.com/uclouvain/${Name}
Source=		https://github.com/uclouvain/${Name}/archive/v${Version}.tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define before_build_hook
mkdir -p $(BuildDir)/build;\
cd $(BuildDir)/build ;\
cmake .. -DCMAKE_BUILD_TYPE=Release \
        -DWITH_TIFF=ON -DBUILD_TIFF=OFF \
        -DTIFF_INCLUDE_DIR=/usr/local/include/ -DTIFF_LIBRARY=/usr/local/lib/libtiff.dylib
endef


define test_hook
$(BinDir)/opj_compress -h | grep $(Version)
endef
