# fish is a smart and user-friendly command line shell

include ../../Library/GNU.mk

Title=		Fish Shell
Name=		fish
Version=	2.7.1
Site=		https://fishshell.com/
Source=		https://github.com/fish-shell/fish-shell/releases/download/$(Version)/fish-$(Version).tar.gz
License=	GPLv2

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYING

define after_install_hook
mv $(DestDir)$(SysConfDir)/fish/config.fish \
	$(DestDir)$(SysConfDir)/fish/config.fish.default
endef

define test_hook
$(BinDir)/fish 2>&1  --version | grep $(Version)
endef
