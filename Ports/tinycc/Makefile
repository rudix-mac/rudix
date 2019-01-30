include ../../Library/GNU.mk

Title=		TinyCC
Name=		tinycc
Version=	0.9.27
Site=		https://bellard.org/tcc/
Source=		https://repo.or.cz/tinycc.git/snapshot/5d805a90e3a994e04e88235bcfae62f3a70e4bcd.tar.gz
License=        GPL

UncompressedName= tinycc-5d805a9

define build_hook
cd $(BuildDir); ./configure; make
endef

define test_hook
$(BinDir)/tcc -v | grep $(Version)
endef
