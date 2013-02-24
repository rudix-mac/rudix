include ../../Library/GNU.mk

Title=		Vifm
Name=		vifm
Version=	0.7.3a
Revision=	0
URL=		http://sourceforge.net/projects/vifm/files/vifm/
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --with-gtk=no

define test_inner_hook
$(BinDir)/vifm --version | grep $(Version)
endef
