include ../../Library/GNU.mk

Title=		Asynchronous Event Library
Name=		libevent
Version=	2.0.22
Site=		http://libevent.org/
Source=		http://downloads.sourceforge.net/levent/$(Name)-$(Version)-stable.tar.gz
License=	BSD
LicenseFile=	$(SourceDir)/LICENSE
UncompressedName=$(Name)-$(Version)-stable

define test_hook
test -f $(LibDir)/libevent.la
endef
