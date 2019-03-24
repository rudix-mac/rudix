# Network Security Services

include ../../Library/GNU.mk

Title=		NSS
Name=		nss
Version=	3.39
Site=		http://www.mozilla.org/projects/security/pki/nss/
Source=		https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_39_RTM/src/nss-$(Version).tar.gz
License=        MPLv2

define test_hook
$(BinDir)/nss --version | grep $(Version)
endef
