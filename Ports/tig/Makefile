include ../../Library/GNU.mk

Title=		Text-Mode Interface for Git
Name=		tig
Version=	2.0.3
Revision=	0
Site=		http://jonas.nitro.dk/tig/
URL=		http://jonas.nitro.dk/tig/releases/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README.adoc

define test_inner_hook
$(BinDir)/tig --version | grep $(Version)
endef
