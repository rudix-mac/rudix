include ../../Library/GNU.mk

Title=		APR Utility
Name=		apr-util
Version=	1.6.1
Site=		https://apr.apache.org/
Source=		https://downloads.apache.org/apr/apr-util-$(Version).tar.bz2
License=	Apache License
LicenseFile=	$(SourceDir)/LICENSE

BuildRequires += $(BinDir)/apr-1-config	# static-apr
GnuConfigureExtra += --with-apr=$(BinDir)/apr-1-config

define test_hook
$(BinDir)/apu-1-config --version
endef
