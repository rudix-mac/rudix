include ../../Library/GNU.mk

Title=		Vifm
Name=		vifm
Version=	0.8
Site=		http://vifm.info
Source=		http://prdownloads.sourceforge.net/vifm/vifm-$(Version).tar.bz2
CheckSum=	6988fce1eb2038f6e3910819588fe67d755099c1
License=	GPL

GnuConfigureExtra += --with-gtk=no

define test_inner_hook
$(BinDir)/vifm --version | grep $(Version)
endef
