include ../../Library/GNU.mk

Title=		GNU Global
Name=		global
Version=	6.6.3
Site=		https://www.gnu.org/software/global/
Source=		https://ftp.gnu.org/pub/gnu/global/global-$(Version).tar.gz
License=	GPLv3
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/global --version | grep $(Version)
endef
