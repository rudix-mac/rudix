include ../../Library/GNU.mk

Title=		LibreSSL
Name=		libressl
Version=	3.0.2
Site=		https://www.libressl.org
Source=		https://ftp.openbsd.org/pub/OpenBSD/$(Title)/$(Name)-$(Version).tar.gz
License=        OpenSSL License
ReadMeFile=	$(SourceDir)/README.md
ConfigureFlags += --enable-extratests

GnuConfigureExtra += --enable-nc
GnuConfigureExtra += --with-openssldir=$(SysConfDir)/ssl

define after_install_hook
mv $(InstallDir)$(SysConfDir)/ssl $(InstallDir)$(SysConfDir)/ssl.default
endef

define test_hook
$(BinDir)/openssl version | grep $(Version)
endef
