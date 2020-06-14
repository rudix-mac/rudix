include ../../Library/GNU.mk

Title=		MG-Portable
Name=		mg
Version=	6.7
Site=		https://github.com/ibara/mg
Source=		https://github.com/ibara/mg/archive/mg-$(Version).tar.gz
License=        BSD

UncompressedName = mg-mg-$(Version)
ReadMeFile = $(BuildDir)/README.md
LicenseFile = $(BuildDir)/README-mg

define after_install_hook
install -m 0644 $(BuildDir)/tutorial $(DestDir)$(DocDir)/$(Name)
endef

define test_hook
# $(BinDir)/mg --version | grep $(Version)
true
endef
