# LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014

include ../../Library/GNU.mk

Title=		LibreSSL
Name=		libressl
Version=	3.3.3
Site=		https://www.libressl.org
Source=		https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$(Version).tar.gz
License=        OpenSSL License
ReadMeFile=	$(SourceDir)/README.md

define after_install_hook
mv $(InstallDir)$(SysConfDir)/ssl $(InstallDir)$(SysConfDir)/ssl.default
endef

define test_hook
$(BinDir)/openssl version | grep $(Version)
endef
