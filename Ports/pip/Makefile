include ../../Library/Python.mk

Title=		Python pip
Name=		pip
Version=	1.4
Revision=	0
URL=		http://pypi.python.org/packages/source/p/pip/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/pip --version
endef
