include ../../Library/GNU.mk

Title=		Z shell
Name=		zsh
Version=	5.9
Site=		https://www.zsh.org
Source=		https://downloads.sourceforge.net/zsh/$(Name)-$(Version).tar.xz
Source=		https://www.zsh.org/pub/zsh-$(Version).tar.xz
Files=		https://www.zsh.org/pub/zsh-$(Version)-doc.tar.xz
License=	MIT-like

LicenseFile=	$(SourceDir)/LICENCE

MakeInstallExtra+=install.info

define after_install_hook
rm -f $(InstallDir)/$(BinDir)/zsh-$(Version)
rm -f $(InstallDir)/$(BinDir)/zsh.old
cd $(InstallDir)/$(BinDir) ; ln -sf zsh zsh5
endef

define test_hook
$(BinDir)/zsh --version | grep $(Version)
endef
