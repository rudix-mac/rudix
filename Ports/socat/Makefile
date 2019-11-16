include ../../Library/GNU.mk

Title=		Socat
Name=		socat
Version=	1.7.3.3
Site=		http://www.dest-unreach.org/socat/
Source=		http://www.dest-unreach.org/socat/download/socat-$(Version).tar.gz
License=	GPLv2

define test_hook
$(BinDir)/socat -V | grep $(Version)
endef
