include ../../Library/GNU.mk

Title=		Grap
Name=		grap
Version=	1.45
Site=		http://www.lunabase.org/~faber/Vault/software/grap
Source=		http://www.lunabase.org/~faber/Vault/software/grap/$(Name)-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/grap --version | grep $(Version)
endef
