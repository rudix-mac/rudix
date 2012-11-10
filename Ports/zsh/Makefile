include ../../Library/GNU.mk

Title=		Z shell
Name=		zsh
Version=	5.0.0
Revision=	0
URL=		http://sourceforge.net/projects/zsh/files/zsh/$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENCE

define install_post_hook
rm -f $(InstallDir)/$(BinDir)/zsh-$(Version)
rm -f $(InstallDir)/$(BinDir)/zsh.old
cd $(InstallDir)/$(BinDir) ; ln -sf zsh zsh5
endef

define test_inner_hook
$(BinDir)/zsh --version
endef
