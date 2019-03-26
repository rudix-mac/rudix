include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	19.0.3
Site=		https://pip.pypa.io/
Source=		https://github.com/pypa/pip/archive/$(Version).tar.gz
Source=		https://files.pythonhosted.org/packages/36/fa/51ca4d57392e2f69397cd6e5af23da2a8d37884a605f9e3f2d3bfdc48397/pip-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_hook
$(BinDir)/pip --version | grep $(Version)
endef
