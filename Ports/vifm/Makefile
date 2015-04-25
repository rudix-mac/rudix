include ../../Library/GNU.mk

Title=		Vifm
Name=		vifm
Version=	0.7.3a
Revision=	0
Site=		http://vifm.sourceforge.net/index.html
Source=		http://sourceforge.net/projects/vifm/files/vifm//$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --with-gtk=no

define test_inner_hook
$(BinDir)/vifm --version | grep $(Version)
endef
