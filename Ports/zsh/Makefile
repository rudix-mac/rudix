include ../../Library/GNU.mk

Title=		Z shell
Name=		zsh
Version=	5.2
Revision=	0
Site=		http://www.zsh.org
Source=		http://downloads.sourceforge.net/zsh/$(Name)-$(Version).tar.xz
Checksum=	a93d034fcaa470bf8557fc11a9d0e86300325936
License=	GPL

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
