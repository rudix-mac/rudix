BuildRequires += $(LibDir)/libxmp.a # static-libxmp

include ../../Library/GNU.mk

Title=		Extended Module player
Name=		xmp
Version=	4.0.1
Revision=	0
URL=		http://downloads.sourceforge.net/project/xmp/xmp/$(Version)
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/xmp --version | grep $(Version)
$(BinDir)/xmp $(SourceDir)/delicate_oooz\!.mod
endef
