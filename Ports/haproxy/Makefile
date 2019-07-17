BuildRequires += $(LibDir)/libpcre.la # pcre

include ../../Library/Unix.mk

Title=		HAProxy
Name=		haproxy
Version=	1.7.2
Site=		http://www.haproxy.org
Source=		http://www.haproxy.org/download/1.5/src/$(Name)-$(Version).tar.gz
License=	GPL/LGPL

LicenseFile=	$(SourceDir)/LICENSE

MakeExtra += TARGET=macosx
MakeExtra += USE_ZLIB=1
MakeExtra += USE_OPENSSL=1
MakeExtra += USE_PCRE=1 USE_PCRE_JIT=1
MakeExtra += USE_KQUEUE=1
MakeInstallExtra += SBINDIR=$(BinDir)

define after_install_hook
rm -f $(DestDir)$(BinDir)/haproxy-systemd-wrapper
endef

define test_hook
$(BinDir)/haproxy -vv
endef
