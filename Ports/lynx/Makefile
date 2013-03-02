BuildRequires += $(LibDir)/libintl.la

include ../../Library/GNU.mk

Title=		Lynx
Name=		lynx
Version=	2.8.8
Revision=	0
URL=		http://lynx.isc.org/current/
Source=		$(Name)$(Version)dev.15.tar.bz2

UncompressedName=lynx2-8-8

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -liconv -framework CoreFoundation
endif

GnuConfigureExtra += --enable-ipv6
GnuConfigureExtra += --with-ssl

define install_post_hook
mv $(InstallDir)$(Prefix)/etc/lynx.cfg $(InstallDir)$(Prefix)/etc/lynx.cfg.default
mv $(InstallDir)$(Prefix)/etc/lynx.lss $(InstallDir)$(Prefix)/etc/lynx.lss.default
install -m 644 $(SourceDir)/{CHANGES,COPYHEADER*,PROBLEMS} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/lynx --version
endef
