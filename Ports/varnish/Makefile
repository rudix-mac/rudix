BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/GNU.mk

Title=		Varnish Cache
Name=		varnish
Version=	3.0.2
Revision=	1
URL=		http://repo.varnish-cache.org/source/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef
