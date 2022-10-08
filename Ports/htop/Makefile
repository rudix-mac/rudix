include ../../Library/GNU.mk

BuildRequires += $(BinDir)/autoconf	# autoconf
BuildRequires += $(BinDir)/automake	# automake

Title=		htop
Name=		htop
Version=	3.2.1
Site=		https://htop.dev/
Source=		https://github.com/htop-dev/htop/releases/download/$(Version)/htop-$(Version).tar.xz
License=	GPLv2

define before_build_hook
$(verify_buildrequires)
$(verify_buildsuggests)
cd $(BuildDir) && ./autogen.sh
endef

define test_hook
$(BinDir)/htop --version | grep $(Version)
endef
