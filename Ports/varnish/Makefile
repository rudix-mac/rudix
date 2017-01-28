BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/GNU.mk

Title=		Varnish Cache
Name=		varnish
Version=	3.0.3
Site=		https://www.varnish-cache.org/
Source=		http://repo.varnish-cache.org/source//$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef

define test_inner_hook
$(SBinDir)/varnishd -V
endef
