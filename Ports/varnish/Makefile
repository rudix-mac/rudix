BuildRequires += /usr/local/bin/pkg-config
BuildRequires += /usr/local/bin/pcre-config

include ../../Library/GNU.mk

Title=		Varnish Cache
Name=		varnish
Version=	3.0.2
Revision=	0
URL=		http://repo.varnish-cache.org/source/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

StripExtra += -x # Due `Symbol not found' error

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef
