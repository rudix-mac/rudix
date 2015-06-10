include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	7.0.3
Revision=	0
Site=		https://pypi.python.org/pypi/pip/
Source=		https://pypi.python.org/packages/source/p/pip/pip-$(Version).tar.gz
Checksum=	5802dfe6dde45790e8a3e6f98f4f94219320f904
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
