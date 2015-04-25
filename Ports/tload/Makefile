include ../../Library/Unix.mk

Description=	tload (Mac) from procps 3.2.8
Title=		Tload
Name=		tload
Version=	3.2.8
Revision=	2
Site=		https://github.com/ruda/tload/
Source=		https://github.com/ruda/tload/archive//$(Version).tar.gz
License=	GPL

define install_inner_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/tload $(DestDir)$(BinDir)
install -d $(DestDir)$(ManDir)/man1
install -m 644 $(BuildDir)/tload.1 $(DestDir)$(ManDir)/man1
$(install_base_documentation)
endef

define test_inner_hook
$(BinDir)/tload -V
endef
