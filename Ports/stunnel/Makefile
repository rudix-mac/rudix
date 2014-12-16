include ../../Library/GNU.mk

Title=		Stunnel
Name=		stunnel
Version=	5.01
Revision=	0
Site=		http://www.stunnel.org/
URL=		https://www.stunnel.org/downloads
Source=		$(Name)-$(Version).tar.gz
Checksum=	e974c2b7854c2de989b8b161be598cf2222a8a1a
License=	GPL

define install_post_hook
mv $(InstallDir)/usr/local/etc/stunnel/stunnel.conf-sample \
	$(InstallDir)/usr/local/etc/stunnel/stunnel.conf.default
endef

define test_inner_hook
$(BinDir)/stunnel -version 2>&1 | grep $(Version)
endef
