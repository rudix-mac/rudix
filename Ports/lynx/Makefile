include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libintl.la # gettext

Title=		Lynx
Name=		lynx
Version=	2.8.9
Site=		http://lynx.isc.org
Source=		http://lynx.isc.org/current/$(Name)$(Version)dev.6.tar.bz2
License=	GPL

UncompressedName=lynx2-8-9

GnuConfigureExtra += --enable-ipv6
GnuConfigureExtra += --with-ssl

define after_install_hook
mv $(InstallDir)$(Prefix)/etc/lynx.cfg $(InstallDir)$(Prefix)/etc/lynx.cfg.default
mv $(InstallDir)$(Prefix)/etc/lynx.lss $(InstallDir)$(Prefix)/etc/lynx.lss.default
install -m 644 $(SourceDir)/{CHANGES,COPYHEADER*,PROBLEMS} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/lynx --version | grep $(Version)
endef
