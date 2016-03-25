include ../../Library/GNU.mk

Title=		dtach
Name=		dtach
Version=	0.8
Revision=	11
Site=		http://dtach.sourceforge.net
Source=		http://downloads.sourceforge.net/dtach/$(Name)-$(Version).tar.gz
License=	GPL

define install_inner_hook
$(install_base_documentation)
$(install_gnu_documentation)
install -d $(DestDir)$(BinDir)
install -m 755 $(SourceDir)/dtach $(DestDir)$(BinDir)/dtach
install -d $(DestDir)$(ManDir)/man1
install -m 644 $(SourceDir)/dtach.1 $(DestDir)$(ManDir)/man1/dtach.1
endef

define test_inner_hook
$(BinDir)/dtach --version | grep $(Version)
endef
