include ../../Library/GNU.mk

Title=		Bash Completion
Name=		bash-completion
Version=	2.7
Site=       https://github.com/scop/bash-completion/
Source=     https://github.com/scop/$(Name)/releases/download/$(Version)/$(Name)-$(Version).tar.xz
License=	GPL
ReadMeFile=	$(SourceDir)/README.md

define after_install_hook
mv $(InstallDir)$(SysConfDir)/profile.d/bash_completion.sh \
	$(InstallDir)$(SysConfDir)/bash_completion.sh.default
rmdir $(InstallDir)$(SysConfDir)/profile.d
endef

define test_hook
. $(SysConfDir)/bash_completion.sh
endef
