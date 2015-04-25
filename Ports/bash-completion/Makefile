include ../../Library/GNU.mk

Title=		Bash Completion
Name=		bash-completion
Version=	2.1
Revision=	0
Site=		http://bash-completion.alioth.debian.org
Source=		http://bash-completion.alioth.debian.org/files/$(Name)-$(Version).tar.bz2
License=	GPL

define install_post_hook
mv $(InstallDir)$(SysConfDir)/profile.d/bash_completion.sh \
	$(InstallDir)$(SysConfDir)/bash_completion.sh.default
rmdir $(InstallDir)$(SysConfDir)/profile.d
endef

define test_inner_hook
. $(SysConfDir)/bash_completion.sh
endef
