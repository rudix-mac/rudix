BuildRequires=	/usr/local/bin/pkg-config
#BuildRequires+=	/usr/local/lib/libpcre.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://varnish.projects.linpro.no/
License=	BSD
Description=	Varnish Cache is a web application accelerator also known as a caching HTTP reverse proxy
Title=		Varnish Cache
Name=		varnish
Version=	3.0.0
Revision=	0
URL=		http://repo.varnish-cache.org/source/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

GnuConfigureExtra = PCRE_LIBS="-L/usr/local/lib /usr/local/lib/libpcre.a"

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef
