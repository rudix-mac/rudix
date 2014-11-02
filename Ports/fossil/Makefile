include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	1.26
AltVersion=	20140612172556
Revision=	0
Site=		http://www.fossil-scm.org/
URL=		http://www.fossil-scm.org/download
Source=		$(Name)-src-$(AltVersion).tar.gz
Checksum=	173c3350ba39ecfee6e660f866b4f3104e351b33
License=	BSD

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

UncompressedName=$(Name)-src-$(AltVersion)

define test_inner_hook
$(BinDir)/fossil version
endef
