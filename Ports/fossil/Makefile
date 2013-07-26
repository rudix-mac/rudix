include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	1.26
AltVersion=	20130618210923
Revision=	0
URL=		http://www.fossil-scm.org/download
Source=		$(Name)-src-$(AltVersion).tar.gz

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

UncompressedName=$(Name)-src-$(AltVersion)

define test_inner_hook
$(BinDir)/fossil version
endef
