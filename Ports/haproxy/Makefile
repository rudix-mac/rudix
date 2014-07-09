BuildRequires += $(LibDir)/libpcre.la

include ../../Library/Unix.mk

Title=		HAProxy
Name=		haproxy
Version=	1.5.1
Revision=	0
Site=		http://www.haproxy.org
URL=		http://www.haproxy.org/download/1.5/src
Source=		$(Name)-$(Version).tar.gz
License=	GPL/LGPL

LicenseFile=	$(SourceDir)/LICENSE

MakeExtra += TARGET=macosx
MakeExtra += USE_ZLIB=1
MakeExtra += USE_OPENSSL=1
MakeExtra += USE_PCRE=1 USE_PCRE_JIT=1
MakeExtra += USE_KQUEUE=1
MakeInstallExtra += SBINDIR=$(BinDir)

define install_post_hook
rm -f $(InstallDir)$(BinDir)/haproxy-systemd-wrapper
endef

define test_inner_hook
$(BinDir)/haproxy -vv
endef
