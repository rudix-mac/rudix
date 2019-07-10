include ../../Library/GNU.mk

BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libintl.la # gettext
BuildRequires += $(LibDir)/libidn.la # libidn

Title=		msmtp
Name=		msmtp
Version=	1.4.31
Site=		http://msmtp.sourceforge.net/
Source=		http://sourceforge.net/projects/msmtp/files/msmtp/$(Version)/$(Name)-$(Version).tar.bz2
License=	GPL

EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
GnuConfigureExtra += --with-ssl=openssl

define after_install_hook
install -m 644 $(SourceDir)/doc/msmtp* $(InstallDir)/$(DocDir)/$(Name)  
endef

define test_hook
$(BinDir)/msmtp --version
endef
