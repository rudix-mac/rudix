include ../../Library/GNU.mk

Title=		Pkg-Config
Name=		pkg-config
AltName=	pkg
Version=	0.28
Revision=	1
Site=		http://www.freedesktop.org/wiki/Software/pkg-config
Source=		http://pkgconfig.freedesktop.org/releases//$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-internal-glib
GnuConfigureExtra += --disable-host-tool

define test_inner_hook
$(BinDir)/pkg-config --version | grep $(Version)
endef
