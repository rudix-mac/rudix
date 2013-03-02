include ../../Library/GNU.mk

Title=		Dtach
Name=		dtach
Version=	0.8
Revision=	9
URL=		http://downloads.sourceforge.net/dtach
Source=		$(Name)-$(Version).tar.gz

define install_inner_hook
$(install_base_documentation)
$(install_gnu_documentation)
install -d $(InstallDir)/$(BinDir)
install -m 755 $(SourceDir)/dtach $(InstallDir)/$(BinDir)/dtach
install -d $(InstallDir)/$(ManDir)/man1
install -m 644 $(SourceDir)/dtach.1 $(InstallDir)/$(ManDir)/man1/dtach.1
endef

define test_inner_hook
$(BinDir)/dtach --version
endef
