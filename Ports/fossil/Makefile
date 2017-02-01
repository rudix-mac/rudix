include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	1.26
AltVersion=	20140612172556
Site=		http://www.fossil-scm.org/
Source=		http://www.fossil-scm.org/download/$(Name)-src-$(AltVersion).tar.gz
License=	BSD

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

UncompressedName=$(Name)-src-$(AltVersion)

define test_inner_hook
$(BinDir)/fossil version
endef
