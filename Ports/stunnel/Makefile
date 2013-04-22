include ../../Library/GNU.mk

Title=		Stunnel
Name=		stunnel
Version=	4.56
Revision=	0
URL=		http://mirrors.zerg.biz/stunnel/
Source=		$(Name)-$(Version).tar.gz

define install_post_hook
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.conf-sample \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.conf.default
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.pem \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.pem.default
endef

define test_inner_hook
$(BinDir)/stunnel -version || true
endef
