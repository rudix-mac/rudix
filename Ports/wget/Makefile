BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libidn.la # static-libidn
BuildRequires += $(LibDir)/libssl.la # static-libressl

include ../../Library/GNU.mk

Title=		GNU Wget
Name=		wget
Version=	1.18
Site=		http://www.gnu.org/software/wget/
Source=		http://ftp.gnu.org/gnu/wget/$(Name)-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --with-ssl=openssl --with-libssl-prefix=$(Prefix)
GnuConfigureExtra += --with-libidn=$(Prefix)

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc \
	$(InstallDir)/$(Prefix)/etc/wgetrc.default
endef

define test_inner_hook
$(BinDir)/wget --version | grep $(Version)
nm $(BinDir)/wget | grep -q intl
nm $(BinDir)/wget | grep -q idn
nm $(BinDir)/wget | grep -q ssl
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif
