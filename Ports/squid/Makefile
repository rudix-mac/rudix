include ../../Library/GNU.mk

Title=		Squid Caching Proxy
Name=		squid
Version=	3.5.4
Revision=	1
Site=		http://www.squid-cache.org/
Source=		http://www.squid-cache.org/Versions/v3/3.5/$(Name)-$(Version).tar.xz
License=	GPL

LicenseFile=	$(SourceDir)/COPYING

CppFlags += -Wno-error=deprecated-declarations

GnuConfigureExtra += --datarootdir=$(DataDir)/squid
GnuConfigureExtra += --with-maxfd=1024
GnuConfigureExtra += --disable-eui

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/cachemgr.conf \
	$(InstallDir)/$(SysConfDir)/cachemgr.conf.default
rm -f $(InstallDir)/$(SysConfDir)/*.conf
endef
