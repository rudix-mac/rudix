include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	6.1.1
Revision=	0
Site=		https://pip.pypa.io/ # https://pypi.python.org/pypi/pip/
Source=		http://pypi.python.org/packages/source/p/pip//pip-$(Version).tar.gz
Checksum=	f649528990ba4c6b5a3f4811c63ced45405ec4d4
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
