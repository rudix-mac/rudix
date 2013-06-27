BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libidn.la # static-libidn

include ../../Library/GNU.mk

Title=		mpop
Name=		mpop
Version=	1.0.28
Revision=	0
URL=		http://sourceforge.net/projects/mpop/files/mpop/$(Version)
Source=		$(Name)-$(Version).tar.bz2

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
GnuConfigureExtra += --with-ssl=openssl

define install_post_hook
install -m 644 $(SourceDir)/doc/mpop* $(InstallDir)/$(DocDir)/$(Name)  
endef

define test_inner_hook
$(BinDir)/mpop --version
endef
