include ../../Library/GNU.mk

Title=		Pkg-Config
Name=		pkg-config
AltName=	pkg
Version=	0.28
Revision=	0
URL=		http://pkgconfig.freedesktop.org/releases/
Source=		$(Name)-$(Version).tar.gz

GnuConfigureExtra += --with-internal-glib
GnuConfigureExtra += --disable-host-tool

define test_inner_hook
$(BinDir)/pkg-config --version
endef
