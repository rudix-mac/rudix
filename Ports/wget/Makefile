BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libidn.la # static-libidn

include ../../Library/GNU.mk

Title=		GNU Wget
Name=		wget
Version=	1.15
Revision=	1
Site=		http://www.gnu.org/software/wget/
URL=		http://ftp.gnu.org/gnu/wget/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

GnuConfigureExtra += --with-ssl=openssl
GnuConfigureExtra += --with-libidn=$(Prefix)

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc \
	$(InstallDir)/$(Prefix)/etc/wgetrc.default
endef

define test_inner_hook
$(BinDir)/wget --version | grep $(Version)
nm $(BinDir)/wget | grep -q intl
nm $(BinDir)/wget | grep -q idn
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif
