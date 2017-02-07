include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	1.37
Site=		http://www.fossil-scm.org/
Source=		http://www.fossil-scm.org/index.html/uv/download/$(Name)-src-$(Version).tar.gz
License=	BSD

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

UncompressedName=$(Name)-src-$(Version)

define test_hook
$(BinDir)/fossil version
endef
