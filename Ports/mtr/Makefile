include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.86
Site=		https://github.com/traviscross/mtr
Source=		ftp://www.bitwizard.nl/mtr/mtr-$(Version).tar.gz
License=	GPLv2

GnuConfigureExtra += --without-gtk
MTR_SETUID?=yes

define after_install_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
sudo $(BinDir)/mtr --version | grep $(Version)
endef

define before_strip_hook
chmod +w $(DestDir)$(SBinDir)/mtr
endef

ifeq ($(MTR_SETUID),yes)
define before_pkg_hook
@echo "mtr binary has setuid on"
sudo chown root:wheel $(DestDir)$(SBinDir)/mtr
sudo chmod +s $(DestDir)$(SBinDir)/mtr
endef
endif

BuildRequires += $(BinDir)/autoconf # autoconf
