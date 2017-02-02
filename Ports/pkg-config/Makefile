include ../../Library/GNU.mk

Title=		Pkg-Config
Name=		pkg-config
Version=	0.29.1
Site=		https://www.freedesktop.org/wiki/Software/pkg-config/
Source=		http://pkgconfig.freedesktop.org/releases/$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-internal-glib
GnuConfigureExtra += --disable-host-tool

define test_hook
$(BinDir)/pkg-config --version | grep $(Version)
endef
