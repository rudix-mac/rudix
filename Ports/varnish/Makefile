BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/GNU.mk

Title=		Varnish Cache
Name=		varnish
Version=	3.0.3
Revision=	0
URL=		http://repo.varnish-cache.org/source/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef

define test_inner_hook
$(SBinDir)/varnishd -V
endef
