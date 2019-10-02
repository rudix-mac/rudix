include ../../Library/GNU.mk

Title=		GNU Global
Name=		global
Version=	6.6.3
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/global --version | grep $(Version)
endef
