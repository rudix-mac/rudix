include ../../Library/Python.mk

Title=		Python pip
Name=		pip
Version=	1.3.1
Revision=	0
URL=		http://pypi.python.org/packages/source/p/pip/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/docs/index.txt
LicenseFile=	$(SourceDir)/license.txt

define test_inner_hook
$(BinDir)/pip --version
endef
