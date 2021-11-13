include ../../Library/Unix.mk

Title=		Neofetch
Name=		neofetch
Version=	7.1.0
Site=		https://github.com/dylanaraps/neofetch/
Source=		https://github.com/dylanaraps/neofetch/archive/refs/tags/$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.md

MakeInstallExtra += PREFIX=$(Prefix)

define test_hook
$(BinDir)/neofetch
$(BinDir)/neofetch --version | grep $(Version)
endef
