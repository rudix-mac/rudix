include ../../Library/GNU.mk

WITH_SSL?=yes
ifeq ($(WITH_SSL),yes)
BuildRequires += $(LibDir)/libssl.la	# libressl | openssl
else
GnuConfigureExtra += --disable-openssl
endif

Title=		LibEvent
Name=		libevent
Version=	2.1.12
Site=		https://libevent.org
Source=		https://github.com/libevent/libevent/releases/download/release-$(Version)-stable/libevent-$(Version)-stable.tar.gz
License=	BSD
LicenseFile=	$(SourceDir)/LICENSE
ReadMeFile=	$(PortDir)/README.txt
UncompressedName=$(Name)-$(Version)-stable

define test_hook
test -f $(LibDir)/libevent.la
endef
