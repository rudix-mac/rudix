include ../../Library/GNU.mk

Title=		Tig
Name=		tig
Version=	2.3.3
Site=		https://jonas.github.io/tig/
Source=		https://github.com/jonas/tig/releases/download/tig-$(Version)/tig-$(Version).tar.gz
License=	GPLv2

ReadMeFile=	$(SourceDir)/README.adoc

define test_hook
$(BinDir)/tig --version | grep $(Version)
endef
