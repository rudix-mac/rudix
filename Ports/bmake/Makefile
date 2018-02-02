include ../../Library/Configure.mk

Title=		bmake
Name=		bmake
Version=	20170812
Site=		http://crufty.net/help/sjg/bmake.html
Source=		http://www.crufty.net/ftp/pub/sjg/bmake-$(Version).tar.gz
License=	BSD
Description=	bmake tool
LicenseFile=	LICENSE

UncompressedName = $(Name)

define build_hook
cd $(BuildDir) && ./configure && sh ./make-bootstrap.sh
endef

define check_hook
endef

define install_hook
mkdir -p $(InstallDir)/$(ManDir)/man1 $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/$(Name) $(InstallDir)/$(BinDir)
install -m 644 $(BuildDir)/$(Name).1 $(InstallDir)/$(ManDir)/man1/
$(install_base_documentation)
$(install_extra_documentation)
$(strip_macho)
endef

define test_hook
stat $(BinDir)/bmake
endef
