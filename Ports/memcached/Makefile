BuildRequires += $(LibDir)/libevent.la # static-libevent

include ../../Library/GNU.mk

Title=		memcached
Name=		memcached
Version=	1.4.17
Revision=	0
URL=		http://www.memcached.org/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md

define install_post_hook
install -m 644 $(SourceDir)/{doc/CONTRIBUTORS,doc/*.txt} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/memcached -h | grep $(Version)
endef
