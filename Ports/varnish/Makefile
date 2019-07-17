BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(BinDir)/pcre-config # pcre

include ../../Library/GNU.mk

Title=		Varnish Cache
Name=		varnish
Version=	3.0.3
Site=		https://www.varnish-cache.org/
Source=		http://repo.varnish-cache.org/source//$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define after_install_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef

define test_hook
$(SBinDir)/varnishd -V
endef
