MTR_SETUID?=yes

BuildRequires += $(BinDir)/autoconf # autoconf

include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.86
Site=		https://github.com/traviscross/mtr
Source=		ftp://www.bitwizard.nl/mtr/mtr-$(Version).tar.gz
License=	GPLv2

ConfigureExtra += --without-gtk
ConfigureExtra += --sbindir=$(BinDir)
MakeInstallExtra += sbindir=$(BinDir)

define after_install_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
sudo $(BinDir)/mtr --version | grep $(Version)
endef

define strip_pre_hook
chmod +w $(DestDir)$(BinDir)/mtr
endef

ifeq ($(MTR_SETUID),yes)
define before_pkg_hook
@echo "mtr binary has setuid on"
sudo chown root:wheel $(DestDir)$(BinDir)/mtr
sudo chmod +s $(DestDir)$(BinDir)/mtr
endef
endif
