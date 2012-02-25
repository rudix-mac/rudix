include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Squid
Name=		squid
Version=	2.7
Revision=	0
URL=		http://www.squid-cache.org/Versions/v2/2.7/
Source=		$(Name)-$(Version).STABLE9-20110824.tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=$(Name)-$(Version).STABLE9-20110824
GnuConfigureExtra += --datarootdir=$(DataDir)/squid
GnuConfigureExtra += --with-maxfd=1024

define install_post_hook
mv $(InstallDir)/usr/local/etc/cachemgr.conf $(InstallDir)/usr/local/etc/cachemgr.conf.default
rm -f $(InstallDir)/usr/local/etc/*.conf
endef
