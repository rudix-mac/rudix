include ../../Library/GNU.mk

Title=		Fish Shell
Name=		fish
Version=	2.1.1
Revision=	0
Site=		http://fishshell.com
Source=		http://fishshell.com/files/$(Version)/$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/user_doc/html/license.html

define install_post_hook
mv $(DestDir)$(SysConfDir)/fish/config.fish \
	$(DestDir)$(SysConfDir)/fish/config.fish.default
endef

define test_inner_hook
$(BinDir)/fish 2>&1  --version | grep $(Version)
endef
