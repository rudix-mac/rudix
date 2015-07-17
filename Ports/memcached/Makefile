BuildRequires += $(LibDir)/libevent.la # static-libevent

include ../../Library/GNU.mk

Title=		Memcached
Name=		memcached
Version=	1.4.24
Revision=	0
Site=		http://memcached.org/
Source=		http://www.memcached.org/files/$(Name)-$(Version).tar.gz
Checksum=	32a798a37ef782da10a09d74aa1e5be91f2861db
License=	BSD

ReadMeFile=	$(SourceDir)/README.md

define install_post_hook
install -m 644 $(SourceDir)/{doc/CONTRIBUTORS,doc/*.txt} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/memcached -h | grep $(Version)
endef
