include ../../Library/GNU.mk

Title=		ELinks
Name=		elinks
Version=	0.13
Revision=	3
Site=		http://elinks.cz/
Source=		http://elinks.or.cz/download//$(Name)-current-$(Version).tar.bz2
License=	GPL

UncompressedName=elinks-$(Version)-20140427

define make
make
endef

define install_post_hook
rm -rf $(InstallDir)/$(LibDir)
endef

define test_inner_hook
$(BinDir)/elinks --version | grep $(Version)
endef
