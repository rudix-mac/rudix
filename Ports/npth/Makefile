include ../../Library/GNU.mk

Title=		Npth
Name=		npth
Version=	1.6
Site=		https://rudix.org/
Source=		https://www.gnupg.org/ftp/gcrypt/npth/npth-$(Version).tar.bz2
License=        GPL
LicenseFile = $(SourceDir)/COPYING.LIB

define test_hook
$(BinDir)/npth --version | grep $(Version)
endef
