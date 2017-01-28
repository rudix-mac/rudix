include ../../Library/GNU.mk

Title=		Stunnel
Name=		stunnel
Version=	5.23
Site=		http://www.stunnel.org/
Source=		https://www.stunnel.org/downloads/$(Name)-$(Version).tar.gz
Checksum=	1fbbfa03efc08969778dab25fce901b94126087b
License=	GPL

define install_post_hook
mv $(DestDir)$(SysConfDir)/stunnel/stunnel.conf-sample \
	$(DestDir)$(SysConfDir)/stunnel/stunnel.conf.default
endef

define test_inner_hook
$(BinDir)/stunnel -version 2>&1 | grep $(Version)
endef
