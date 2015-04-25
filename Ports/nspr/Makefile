include ../../Library/GNU.mk

Title=		Netscape Portable Runtime
Name=		nspr
Version=	4.10.4
Revision=	0
Site=		http://www.mozilla.org/projects/nspr/
Source=		http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(Version)/src/$(Name)-$(Version).tar.gz
License=	GPL
BuildDir=$(SourceDir)/nspr

ReadMeFile=README
LicenseFile=$(BuildDir)/LICENSE

define test_inner_hook
$(BinDir)/nspr-config --version
endef
