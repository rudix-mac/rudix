include ../../Library/GNU.mk

define fetch
curl -f -O -C - -L -k
endef

Title=		Bip
Name=		bip
Version=	0.8.8
Revision=	0
URL=		https://projects.duckcorp.org/attachments/download/39
Source=		$(Name)-$(Version).tar.gz

define test_inner_hook
$(BinDir)/bip -v
endef
