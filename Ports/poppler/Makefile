include ../../Library/Unix.mk

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
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(InstallDir)/usr/local;\
make
endef

define install_hook
make -C $(BuildDir)/build install
endef

BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libopenjp2.la # libopenjpeg2
