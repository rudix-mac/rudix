# Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols

include ../../Library/Configure.mk

Title=		OpenSSL
Name=		openssl
Version=	1.1.1k
Site=		https://www.openssl.org/
Source=		https://www.openssl.org/source/openssl-$(Version).tar.gz
License=        OpenSSL License
LicenseFile=	$(SourceDir)/LICENSE
ReadMeFile=	$(SourceDir)/README

ConfigureExtra += darwin64-x86_64-cc
ConfigureExtra += --openssldir=$(SysConfDir)/openssl

define after_install_hook
mv $(InstallDir)$(SysConfDir)/openssl $(InstallDir)$(SysConfDir)/openssl.default
endef

define test_hook
$(BinDir)/openssl version | grep $(Version)
endef
