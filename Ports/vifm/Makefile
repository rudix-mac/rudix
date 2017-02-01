include ../../Library/GNU.mk

Title=		Vifm
Name=		vifm
Version=	0.8
Site=		http://vifm.info
Source=		http://prdownloads.sourceforge.net/vifm/vifm-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --with-gtk=no

define test_inner_hook
$(BinDir)/vifm --version | grep $(Version)
endef
