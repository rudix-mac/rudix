include ../../Library/GNU.mk

Title=		LibreSSL
Name=		libressl
Version=	2.9.2
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
