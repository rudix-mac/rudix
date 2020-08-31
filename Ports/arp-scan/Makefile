include ../../Library/GNU.mk

Title=		Arp Scan
Name=		arp-scan
Version=	1.9.7
Site=		https://github.com/royhills/arp-scan
Source=		$(Site)/archive/$(Version).tar.gz
License=	GPL

define before_build_hook
cd $(BuildDir); autoreconf --install
endef

define test_hook
$(BinDir)/arp-scan --version 2>&1 | grep $(Version)
endef
