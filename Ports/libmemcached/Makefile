BuildRequires += $(LibDir)/libevent.la # libevent

include ../../Library/GNU.mk

Title=		libMemcached
Name=		libmemcached
Version=	1.0.18
Site=		http://libmemcached.org/
Source=		http://launchpad.net/libmemcached/1.0/$(Version)/+download//$(Name)-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/memcat --version
endef
