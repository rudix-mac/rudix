include ../../Library/Unix.mk

Title=		libopenjpeg2
Name=		openjpeg
Version=	2.3.0
Site=		https://github.com/uclouvain/${Name}
Source=		https://github.com/uclouvain/${Name}/archive/v${Version}.tar.gz
License=    GPL
ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define build_hook
mkdir -p $(BuildDir)/build
cd $(BuildDir)/build; \
pwd ;\
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC_LIBS=ON;\
make
endef

define install_pre_hook
mkdir -p $(InstallDir)/usr/local
endef

define install_hook
make DESTDIR=`pwd`/$(InstallDir) -C $(BuildDir)/build install
endef
