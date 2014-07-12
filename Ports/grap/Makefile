include ../../Library/GNU.mk

Title=		Grap
Name=		grap
Version=	1.44
Revision=	0
Site=		http://www.lunabase.org/~faber/Vault/software/grap
URL=		http://www.lunabase.org/~faber/Vault/software/grap
Source=		$(Name)-$(Version).tar.gz
License=	BSD
Checksum=	b15e4e04525301cfbd2900b1f1a028e81a12ba92

define test_inner_hook
$(BinDir)/grap --version | grep $(Version)
endef
