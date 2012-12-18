include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	1.24
Revision=	0
URL=		http://www.fossil-scm.org/download
Source=		$(Name)-src-20121022124804.tar.gz

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

UncompressedName=$(Name)-src-20121022124804

define test_inner_hook
$(BinDir)/fossil version
endef
