include ../../Library/GNU.mk

define fetch
curl -f -O -C - -L -k
endef

Title=		Bip
Name=		bip
Version=	0.8.9
Revision=	0
Site=		http://bip.milkypond.org
Source=		https://projects.duckcorp.org/attachments/download/61/$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/bip -v | grep $(Version)
endef
