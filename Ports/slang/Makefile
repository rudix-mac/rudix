include ../../Library/GNU.mk

Title=		S-Lang
Name=		slang
Version=	2.2.4
Revision=	1
URL=		ftp://space.mit.edu/pub/davis/slang/v2.2
Source=		$(Name)-$(Version).tar.gz

MakeFlags=

define install_post_hook
mv $(InstallDir)$(SysConfDir)/slsh.rc \
	$(InstallDir)$(SysConfDir)/slsh.rc.default
endef

define test_inner_hook
$(BinDir)/slsh --version
endef
