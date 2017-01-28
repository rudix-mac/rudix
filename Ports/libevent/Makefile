include ../../Library/GNU.mk

Title=		Asynchronous Event Library
Name=		libevent
Version=	2.0.22
Site=		http://libevent.org/
Source=		http://downloads.sourceforge.net/levent/$(Name)-$(Version)-stable.tar.gz
Checksum=	a586882bc93a208318c70fc7077ed8fca9862864
License=	BSD
LicenseFile=	$(SourceDir)/LICENSE
UncompressedName=$(Name)-$(Version)-stable

define test_inner_hook
test -f $(LibDir)/libevent.la
endef
