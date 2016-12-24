include ../../Library/GNU.mk

Title=		Z shell
Name=		zsh
Version=	5.3
Revision=	0
Site=		http://www.zsh.org
Source=		http://downloads.sourceforge.net/zsh/$(Name)-$(Version).tar.xz
License=	MIT-like

LicenseFile=	$(SourceDir)/LICENCE

MakeInstallExtra+=install.info

define retrieve_post_hook
$(fetch) http://downloads.sourceforge.net/zsh/zsh-$(Version)-doc.tar.xz
endef

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/zsh-$(Version)
rm -f $(InstallDir)/$(BinDir)/zsh.old
cd $(InstallDir)/$(BinDir) ; ln -sf zsh zsh5
endef

define test_inner_hook
$(BinDir)/zsh --version | grep $(Version)
endef
