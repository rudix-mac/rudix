include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libxmp.a	# static-libxmp
BuildRequires += $(BinDir)/pkg-config	# pkg-config
BuildRequires += $(BinDir)/autoconf	# autoconf
BuildRequires += $(BinDir)/automake	# automake

Title=		xmp
Name=		xmp
Version=	4.1.0
Site=		http://xmp.sourceforge.net
Source=		https://github.com/cmatsuoka/xmp-cli/archive/xmp-$(Version).tar.gz
License=	GPL

UncompressedName=xmp-cli-xmp-$(Version)

define before_build_hook
$(verify_buildrequires)
cd $(BuildDir) && ./autogen.sh
endef

define test_hook
$(BinDir)/xmp --version | grep $(Version)
endef
