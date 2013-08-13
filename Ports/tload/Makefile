include ../../Library/Unix.mk

Title=		Tload
Name=		tload
Version=	3.2.8
Revision=	1
URL=		https://github.com/ruda/tload/archive/
Source=		$(Version).tar.gz

UncompressedName=$(Name)--$(Version)

define test_inner_hook
$(BinDir)/tload -V
endef
