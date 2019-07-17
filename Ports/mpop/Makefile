include ../../Library/GNU.mk

BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libintl.la # gettext
BuildRequires += $(LibDir)/libidn.la # libidn

Title=		mpop
Name=		mpop
Version=	1.0.28
Site=		http://mpop.sourceforge.net/
Source=		http://sourceforge.net/projects/mpop/files/mpop/$(Version)/$(Name)-$(Version).tar.bz2
License=	GPL

EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
GnuConfigureExtra += --with-ssl=openssl

define after_install_hook
install -m 644 $(SourceDir)/doc/mpop* $(InstallDir)/$(DocDir)/$(Name)  
endef

define test_hook
$(BinDir)/mpop --version
endef
