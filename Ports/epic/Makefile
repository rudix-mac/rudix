include ../../Library/GNU.mk

Title=		EPIC5
Name=		epic5
Version=	1.1.10
Site=		http://epicsol.org/
Source=		http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION//$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(BinDir)/epic5 -v | grep $(Version)
endef
