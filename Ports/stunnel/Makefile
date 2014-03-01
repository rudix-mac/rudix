include ../../Library/GNU.mk

Title=		Stunnel
Name=		stunnel
Version=	4.56
Revision=	1
Site=		http://www.stunnel.org/
URL=		http://mirrors.zerg.biz/stunnel/
Source=		$(Name)-$(Version).tar.gz
Checksum=	0e5e495e05b8d14deadd294166b211f87a667b24
License=	GPL

define install_post_hook
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.conf-sample \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.conf.default
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.pem \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.pem.default
endef

define test_inner_hook
$(BinDir)/stunnel -version || true
endef
