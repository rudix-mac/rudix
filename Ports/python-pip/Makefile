include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	8.1.0
Revision=	0
Site=		https://pypi.python.org/pypi/pip/
Source=		https://pypi.python.org/packages/source/p/pip/pip-$(Version).tar.gz
Checksum=	9f52c9f9d6da954e4d7e623ff7bc6d54a3c18f62
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
