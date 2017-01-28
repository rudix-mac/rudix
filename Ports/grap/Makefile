include ../../Library/GNU.mk

Title=		Grap
Name=		grap
Version=	1.45
Site=		http://www.lunabase.org/~faber/Vault/software/grap
Source=		http://www.lunabase.org/~faber/Vault/software/grap/$(Name)-$(Version).tar.gz
License=	BSD
Checksum=	c7a22dcbc1a745a8fba74a888c3e857cd39832b6

define test_inner_hook
$(BinDir)/grap --version | grep $(Version)
endef
