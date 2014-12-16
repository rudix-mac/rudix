BuildRequires += $(LibDir)/libxmp.a # static-libxmp
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		Extended Module player
Name=		xmp
Version=	4.0.7
Revision=	0
Site=		http://xmp.sourceforge.net
URL=		http://downloads.sourceforge.net/xmp
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/xmp --version | grep $(Version)
endef
