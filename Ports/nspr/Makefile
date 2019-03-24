# Netscape Portable Runtime (NSPR)

include ../../Library/GNU.mk

Title=		NSPR
Name=		nspr
Version=	4.19
Site=		http://www.mozilla.org/projects/nspr/
Source=		https://ftp.mozilla.org/pub/nspr/releases/v$(Version)/src/$(Name)-$(Version).tar.gz
License=	MPLv2

ReadMeFile=	README
LicenseFile=	$(BuildDir)/LICENSE

BuildDir=	$(SourceDir)/nspr

GnuConfigureExtra+=	--enable-64bit

define test_hook
$(BinDir)/nspr-config --version | grep $(Version)
endef
