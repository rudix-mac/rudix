include ../../Library/GNU.mk

Title=		Squid Caching Proxy
Name=		squid
Version=	3.5.7
Revision=	0
Site=		http://www.squid-cache.org/
Source=		http://www.squid-cache.org/Versions/v3/3.5/$(Name)-$(Version).tar.xz
License=	GPL

LicenseFile=	$(SourceDir)/COPYING

CppFlags += -Wno-error=deprecated-declarations

GnuConfigureExtra += --with-default-user=_www
GnuConfigureExtra += --with-logdir=$(LocalStateDir)/log/squid
GnuConfigureExtra += --sysconfdir=$(SysConfDir)/squid
GnuConfigureExtra += --datarootdir=$(DataDir)/squid
GnuConfigureExtra += --with-maxfd=1024
GnuConfigureExtra += --disable-eui

define install_post_hook
mv $(DestDir)$(SysConfDir)/squid/cachemgr.conf \
	$(DestDir)$(SysConfDir)/squid/cachemgr.conf.default
rm -f $(DestDir)$(SysConfDir)/squid/*.conf
rm -f $(DEstDir)$(SysConfDir)/squid/errorpage.css
endef

define pkg_pre_hook
@echo "root required: $(DestDir)$(LocalStateDir)/log/squid must be set to _www:_www"
sudo chown _www:_www $(DestDir)$(LocalStateDir)/log/squid
@echo "root required: $(DestDir)$(LocalStateDir)/cache/squid must be set to _www:_www"
sudo chown _www:_www $(DestDir)$(LocalStateDir)/cache/squid
endef
