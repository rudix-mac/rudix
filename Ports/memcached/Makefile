BuildRequires += $(LibDir)/libevent.la # libevent

include ../../Library/GNU.mk

Title=		Memcached
Name=		memcached
Version=	1.5.12
Site=		https://memcached.org/
Source=		https://www.memcached.org/files/$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md

define after_install_hook
install -m 644 $(SourceDir)/{doc/CONTRIBUTORS,doc/*.txt} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/memcached -h | grep $(Version)
endef
