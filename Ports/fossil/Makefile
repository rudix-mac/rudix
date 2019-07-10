BuildRequires += $(LibDir)/libssl.la # libressl

include ../../Library/Configure.mk

Title=		Fossil
Name=		fossil
Version=	2.4
Site=		http://www.fossil-scm.org/
Source=		http://www.fossil-scm.org/index.html/uv/fossil-src-$(Version).tar.gz
License=	BSD

ReadMeFile=	README
LicenseFile=	$(SourceDir)/COPYRIGHT-BSD2.txt

define test_hook
$(BinDir)/fossil version | grep $(Version)
endef
