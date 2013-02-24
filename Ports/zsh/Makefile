include ../../Library/GNU.mk

Title=		Z shell
Name=		zsh
Version=	5.0.2
Revision=	0
URL=		http://sourceforge.net/projects/zsh/files/zsh/$(Version)
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/LICENCE

MakeInstallExtra+=install.info

define retrieve_post_hook
$(fetch) http://sourceforge.net/projects/zsh/files/zsh-doc/$(Version)/zsh-$(Version)-doc.tar.bz2
endef

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/zsh-$(Version)
rm -f $(InstallDir)/$(BinDir)/zsh.old
cd $(InstallDir)/$(BinDir) ; ln -sf zsh zsh5
endef

define test_inner_hook
$(BinDir)/zsh --version | grep $(Version)
endef
