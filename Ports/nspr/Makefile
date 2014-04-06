include ../../Library/GNU.mk

Title=		Netscape Portable Runtime
Name=		nspr
Version=	4.10.4
Revision=	0
URL=		http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(Version)/src
Source=		$(Name)-$(Version).tar.gz
BuildDir=$(SourceDir)/nspr

ReadMeFile=README
LicenseFile=$(BuildDir)/LICENSE

define test_inner_hook
$(BinDir)/nspr-config --version
endef
