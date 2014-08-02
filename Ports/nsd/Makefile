BuildRequies += $(LibDir)/libevent.la # static-libevent

include ../../Library/GNU.mk

Title=		NSD
Name=		nsd
Version=	4.0.3
Revision=	0
Site=		http://www.nlnetlabs.nl/projects/nsd/
URL=		http://www.nlnetlabs.nl/downloads/nsd
Source=		$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/doc/README
LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --sbindir=$(BinDir)

define install_post_hook
rmdir $(InstallDir)/tmp
endef

define test_inner_hook
$(BinDir)/nsd -v 2>&1 | grep $(Version)
otool -L $(BinDir)/nsd | grep ssl
otool -L $(BinDir)/nsd | grep crypto
test -f $(SysConfDir)/nsd/nsd.conf
endef
