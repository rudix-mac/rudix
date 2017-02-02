include ../../Library/GNU.mk

Title=		Tig
Name=		tig
Version=	2.2
Site=		http://jonas.nitro.dk/tig/
Source=		http://jonas.nitro.dk/tig/releases/$(Name)-$(Version).tar.gz
License=	GPLv2

ReadMeFile=	$(SourceDir)/README.adoc

define test_hook
$(BinDir)/tig --version | grep $(Version)
endef
