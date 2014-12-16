include ../../Library/GNU.mk

Title=		EPIC5
Name=		epic5
Version=	1.1.10
Revision=	0
Site=		http://epicsol.org/
URL=		http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION/
Source=		$(Name)-$(Version).tar.bz2
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(BinDir)/epic5 -v | grep $(Version)
endef
