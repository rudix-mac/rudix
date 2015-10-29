include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	7.1.2
Revision=	0
Site=		https://pypi.python.org/pypi/pip/
Source=		https://pypi.python.org/packages/source/p/pip/pip-$(Version).tar.gz
Checksum=	9eb9ea19b630412bc2b2b587fc6bbbee71950a96
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
