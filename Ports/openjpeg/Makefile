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
mkdir -p $(BuildDir)/build
cd $(BuildDir)/build && cmake -DRelease ..
endef


define test_hook
$(BinDir)/opj_compress -h | grep $(Version)
endef
