BuildRequires += $(LibDir)/libevent.la # static-libevent

include ../../Library/GNU.mk

Title=		Memcached
Name=		memcached
Version=	1.4.30
Site=		http://memcached.org/
Source=		http://www.memcached.org/files/$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.md

define install_post_hook
install -m 644 $(SourceDir)/{doc/CONTRIBUTORS,doc/*.txt} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/memcached -h | grep $(Version)
endef
