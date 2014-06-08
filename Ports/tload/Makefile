include ../../Library/Unix.mk

Title=		Tload
Name=		tload
Version=	3.2.8
Revision=	1
Site=		https://github.com/ruda/tload/
URL=		https://github.com/ruda/tload/archive/
Source=		$(Version).tar.gz
License=	GPL

UncompressedName=$(Name)--$(Version)

define test_inner_hook
$(BinDir)/tload -V
endef
