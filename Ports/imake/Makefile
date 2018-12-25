include ../../Library/GNU.mk

Title=		imake
Name=		imake
Version=	1.0.7
Site=		https://www.x.org/
Source=		https://www.x.org/releases/individual/util/$(Name)-$(Version).tar.bz2
License=	MIT

BuildRequires += $(BinDir)/pkg-config	# pkg-config
EnvExtra += PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig"

define test_hook
$(BinDir)/imake --version | grep $(Version)
endef
