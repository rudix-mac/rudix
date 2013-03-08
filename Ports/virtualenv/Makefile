include ../../Library/Python.mk

Title=		Python VirtualEnv
Name=		virtualenv
Version=	1.9.1
Revision=	0
URL=		http://pypi.python.org/packages/source/v/virtualenv/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/docs/index.txt
LicenseFile=	$(SourceDir)/license.txt

define test_inner_hook
$(BinDir)/virtualenv --version
endef
