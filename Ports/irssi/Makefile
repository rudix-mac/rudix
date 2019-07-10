include ../../Library/GNU.mk

BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la # glib
BuildRequires += $(LibDir)/libintl.la # gettext

Title=		Irssi
Name=		irssi
Version=	1.0.1
Site=		http://irssi.org/
Source=		https://github.com/irssi/irssi/releases/download/$(Version)/$(Name)-$(Version).tar.gz
License=	GPL
ReadMeFile=	$(SourceDir)/README.md

GnuConfigureExtra += --with-perl=no # disabled for now

define after_install_hook
mv $(InstallDir)/$(SysConfDir)/irssi.conf \
	$(InstallDir)/$(SysConfDir)/irssi.conf.default
endef

define test_hook
$(BinDir)/irssi --version | grep $(Version)
endef
