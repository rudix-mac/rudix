include ../../Library/Python.mk

Title=		Virtual Python Environment builder
Name=		python-virtualenv
Version=	1.11.4
Revision=	0
Site=		http://www.virtualenv.org
URL=		http://pypi.python.org/packages/source/v/virtualenv/
Source=		virtualenv-$(Version).tar.gz
Checksum=	60b6a01091aa1a88366888ab16e31b9855221d9a
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/docs/virtualenv.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
