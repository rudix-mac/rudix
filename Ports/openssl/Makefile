include ../../Library/GNU.mk

Title=		OpenSSL
Name=		openssl
Version=	1.1.0j
Site=		https://www.openssl.org
Source=		https://www.openssl.org/source/$(Name)-$(Version).tar.gz
License=        GPL

ReadMeFile=	 $(SourceDir)/README
LicenseFile= $(SourceDir)/LICENSE

define build_hook
cd $(BuildDir) && INSTALL_PREFIX=$(DestDir) ./Configure darwin64-x86_64-cc
endef
