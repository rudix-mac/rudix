BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/GNU.mk

Title=		Lighttpd
Name=		lighttpd
Version=	1.4.31
Revision=	0
URL=		http://download.lighttpd.net/lighttpd/releases-1.4.x/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --libdir=$(LibDir)/lighttpd

define install_post_hook
install -d $(InstallDir)/$(SysConfDir)/lighttpd
install -d $(InstallDir)/$(LocalStateDir)/{www,log/lighttpd,run}
install -m 664 lighttpd.conf.default $(InstallDir)/$(SysConfDir)/lighttpd
endef
