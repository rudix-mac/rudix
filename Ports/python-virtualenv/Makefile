include ../../Library/Python.mk

Title=		Python virtualenv
Name=		python-virtualenv
Version=	13.0.3
Revision=	0
Site=		# https://pypi.python.org/pypi/virtualenv
Source=		https://pypi.python.org/packages/source/v/virtualenv/virtualenv-$(Version).tar.gz
Checksum=	8cd0bbc84d4cc99e72eca483912bcdf7ed384c17
License=	MIT

UncompressedName=virtualenv-$(Version)

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE.txt

define test_inner_hook
$(BinDir)/virtualenv --version | grep $(Version)
endef
