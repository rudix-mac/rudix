# https://pypi.python.org/pypi/pip/

include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	1.5.6
Revision=	0
Site=		https://pip.pypa.io/
Source=		http://pypi.python.org/packages/source/p/pip//pip-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_inner_hook
$(BinDir)/pip --version | grep $(Version)
endef
