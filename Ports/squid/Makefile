include ../../Library/GNU.mk

Title=		Squid
Name=		squid
Version=	2.7
AltVersion=	STABLE9-20110824
Revision=	1
Site=		http://www.squid-cache.org/
URL=		http://www.squid-cache.org/Versions/v2/$(Version)/
Source=		$(Name)-$(Version).$(AltVersion).tar.bz2
License=	GPL

LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName = $(Name)-$(Version).$(AltVersion)
GnuConfigureExtra += --datarootdir=$(DataDir)/squid
GnuConfigureExtra += --with-maxfd=1024

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/cachemgr.conf \
	$(InstallDir)/$(SysConfDir)/cachemgr.conf.default
rm -f $(InstallDir)/$(SysConfDir)/*.conf
mkdir $(InstallDir)/$(LocalStateDir)/cache
endef
