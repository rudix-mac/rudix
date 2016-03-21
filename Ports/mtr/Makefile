BuildRequires += $(BinDir)/autoconf # autoconf

include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.86
Revision=	0
Site=		https://github.com/traviscross/mtr
Source=		ftp://www.bitwizard.nl/mtr/mtr-$(Version).tar.gz
License=	GPLv2

ConfigureExtra += --without-gtk

define install_post_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
sudo $(SBinDir)/mtr --version | grep $(Version)
endef
