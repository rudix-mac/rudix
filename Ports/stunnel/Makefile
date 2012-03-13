include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Stunnel
Name=		stunnel
Version=	4.52
Revision=	0
URL=		http://mirrors.zerg.biz/stunnel/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.conf-sample \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.conf.default
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.pem \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.pem.default
endef
