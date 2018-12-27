include ../../Library/GNU.mk

Title=		MLZ-libcerf
Name=		libcerf
Version=	1.10
Site=		http://apps.jcns.fz-juelich.de/doku/sc/libcerf
Source=		http://apps.jcns.fz-juelich.de/src/libcerf/libcerf-1.10.tgz
License=        GPL

define build_hook
mkdir -p $(BuildDir)/build; cd $(BuildDir)/build; cmake ..; make
endef

define install_hook
mkdir -p $(InstallDir); make DESTDIR=$(shell pwd)/$(InstallDir) -C $(BuildDir)/build install
endef
