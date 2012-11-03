BuildRequires += /usr/local/lib/libintl.la

include ../../Library/GNU.mk

Title=		Lynx
Name=		lynx
Version=	2.8.7
Revision=	3
URL=		http://lynx.isc.org/release/
Source=		$(Name)$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = lynx2-8-7

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
$(call test_universal)
endef
