MTR_SETUID?=yes

BuildRequires += $(BinDir)/autoconf # autoconf

include ../../Library/GNU.mk

Title=		MTR
Name=		mtr
Version=	0.92
Site=		http://www.bitwizard.nl/mtr/
Source=		https://www.bitwizard.nl/mtr/files/mtr-$(Version).tar.gz
License=	GPLv2

GnuConfigureExtra += --without-gtk
GnuConfigureExtra += --sbindir=$(BinDir)

define after_install_hook
install $(SourceDir)/{FORMATS,SECURITY,TODO} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
sudo $(BinDir)/mtr --version | grep $(Version)
endef

ifeq ($(MTR_SETUID),yes)
define before_pkg_hook
@echo "mtr-packet binary has setuid on"
sudo chown root:wheel $(DestDir)$(BinDir)/mtr-packet
sudo chmod +s $(DestDir)$(BinDir)/mtr-packet
endef
endif
