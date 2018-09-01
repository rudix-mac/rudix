include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	9.0.3
Site=		https://pip.pypa.io/
Source=		https://github.com/pypa/pip/archive/$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_hook
$(BinDir)/pip --version | grep $(Version)
endef
