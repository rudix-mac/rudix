include ../../Library/GNU.mk

Title=		Stunnel
Name=		stunnel
Version=	5.23
Site=		http://www.stunnel.org/
Source=		https://www.stunnel.org/downloads/$(Name)-$(Version).tar.gz
License=	GPL

define install_post_hook
mv $(DestDir)$(SysConfDir)/stunnel/stunnel.conf-sample \
	$(DestDir)$(SysConfDir)/stunnel/stunnel.conf.default
endef

define test_hook
$(BinDir)/stunnel -version 2>&1 | grep $(Version)
endef
