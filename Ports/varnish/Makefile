BuildRequires=	/usr/local/bin/pkg-config
BuildRequires+=	/usr/local/lib/libpcre.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://varnish.projects.linpro.no/
License=	BSD
Description=	High-performance HTTP accelerator
Title=		Varnish
Name=		varnish
Version=	2.1.4
Revision=	0
URL=		http://www.varnish-software.com/sites/default/files
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/LICENSE

define install_post_hook
cd $(InstallDir)/$(Prefix)/etc/varnish ; mv default.vcl default.vcl.default
endef
