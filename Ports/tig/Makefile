include ../../Library/GNU.mk

Title=		Text-Mode Interface for Git
Name=		tig
Version=	1.2.1
Revision=	0
Site=		http://jonas.nitro.dk/tig/
URL=		http://jonas.nitro.dk/tig/releases/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/tig --version | grep $(Version)
endef
