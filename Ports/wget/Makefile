BuildRequires += $(LibDir)/libintl.la # gettext
BuildRequires += $(LibDir)/libidn.la # libidn
BuildRequires += $(LibDir)/libssl.la # libressl

include ../../Library/GNU.mk

Title=		GNU Wget
Name=		wget
Version=	1.20.3
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/wget/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-ssl=openssl --with-libssl-prefix=$(Prefix)/ssl
GnuConfigureExtra += --with-libidn=$(Prefix)

define after_install_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc \
	$(InstallDir)/$(Prefix)/etc/wgetrc.default
endef

define test_hook
$(BinDir)/wget --version | grep $(Version)
nm $(BinDir)/wget | grep -q intl
nm $(BinDir)/wget | grep -q idn
nm $(BinDir)/wget | grep -q ssl
endef
