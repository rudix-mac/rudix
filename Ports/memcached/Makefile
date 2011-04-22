BuildRequires += $(LibDir)/libevent.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Distributed memory object caching system
Site=		http://memcached.org/
License=	BSD
Title=		memcached
Name=		memcached
Version=	1.4.5
Revision=	1
URL=		http://memcached.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
install -m 644 $(SourceDir)/{doc/CONTRIBUTORS,doc/*.txt} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_post_hook
cd $(SourceDir) ; make test
endef
