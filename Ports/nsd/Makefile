BuildRequires += $(LibDir)/libevent.la # static-libevent

include ../../Library/GNU.mk

Title=		NSD
Name=		nsd
Version=	4.0.3
Site=		http://www.nlnetlabs.nl/projects/nsd/
Source=		http://www.nlnetlabs.nl/downloads/nsd/$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/doc/README
LicenseFile=	$(SourceDir)/LICENSE

GnuConfigureExtra += --with-user=root

define after_install_hook
rmdir $(InstallDir)/tmp
endef

define test_hook
$(BinDir)/nsd -v 2>&1 | grep $(Version)
otool -L $(BinDir)/nsd | grep ssl
otool -L $(BinDir)/nsd | grep crypto
test -f $(SysConfDir)/nsd/nsd.conf
endef
