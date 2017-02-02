BuildRequires += $(LibDir)/libxmp.a # static-libxmp
BuildRequires += $(BinDir)/pkg-config # pkg-config

include ../../Library/GNU.mk

Title=		Extended Module player
Name=		xmp
Version=	4.0.7
Site=		http://xmp.sourceforge.net
Source=		http://downloads.sourceforge.net/xmp/$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/xmp --version | grep $(Version)
endef
