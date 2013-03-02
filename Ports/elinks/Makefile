include ../../Library/GNU.mk

Title=		ELinks
Name=		elinks
Version=	0.13
Revision=	1
URL=		http://elinks.or.cz/download/
Source=		$(Name)-current-$(Version).tar.bz2

UncompressedName=elinks-$(Version)-20130302

define make
make
endef

define install_post_hook
rm -rf $(InstallDir)/$(LibDir)
endef

define test_inner_hook
$(BinDir)/elinks --version
endef
